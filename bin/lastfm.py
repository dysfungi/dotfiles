#!/usr/bin/env python3
import itertools as it
import urllib.parse
from typing import Generator, List, Literal, Optional, Union

import pendulum
import pydantic
import requests
import typer

USER = "derekmfrank"
FORMAT = "json"
API_KEY = "4f1c944ffce8dc320964f0362262307b"
API_SECRET = "0506d0b257ca5969f4b57ec9b1b9b291"  # nosec: B105


cli = typer.Typer()


@cli.command()
def lastfm(
    max_albums: int = 50,
    start_year: Optional[int] = None,
    end_year: Optional[int] = None,
    username: str = "derekmfrank",
):
    """Print user's top albums released between the given years in
    ranked order.
    """
    api = LastFMAPI(api_key=API_KEY, api_secret=API_SECRET, username=username)
    albums = api.get_user_top_albums(max_items=max_albums)
    for idx, album in enumerate(albums):
        if not album.mbid:
            typer.echo(f"missing album.mbid for {album.json()}", err=True)
            continue
        album = api.get_album(album.mbid)
        if album.wiki is None:
            typer.echo(f"unknown publish year for {album.json()}", err=True)
            continue
        elif start_year is not None and album.wiki.published.year < start_year:
            continue
        elif end_year is not None and album.wiki.published.year > end_year:
            continue
        typer.echo(album.json())
    typer.echo(albums)


class WikiDateTime(pendulum.DateTime):

    @classmethod
    def __get_validators__(cls):
        yield cls.validate

    @classmethod
    def validate(cls, v):
        if not isinstance(v, str):
            raise TypeError("string required")
        return pendulum.from_format(v, "DD MMM YYYY, HH:mm")


class PageMetadata(pydantic.BaseModel):
    page: int
    per_page: int = pydantic.Field(alias="perPage")
    total: int
    total_pages: int = pydantic.Field(alias="totalPages")
    user: str


class RankMetadata(pydantic.BaseModel):
    rank: int


class Tag(pydantic.BaseModel):
    url: pydantic.HttpUrl
    name: str


class TagsEnvelope(pydantic.BaseModel):
    tags: List[Tag] = pydantic.Field(alias="tag")


class ArtistSummary(pydantic.BaseModel):
    mbid: str
    name: str
    url: pydantic.HttpUrl


class Track(pydantic.BaseModel):
    metadata: RankMetadata = pydantic.Field(alias="@attr")
    duration: Optional[int]
    url: pydantic.HttpUrl
    name: str
    artist: ArtistSummary


class TracksEnvelope(pydantic.BaseModel):
    track: Union[List[Track], Track]


class Album(pydantic.BaseModel):
    name: str
    artist: ArtistSummary
    playcount: int
    url: pydantic.HttpUrl


class AlbumWiki(pydantic.BaseModel):
    published: WikiDateTime
    summary: str
    content: str


class AlbumInfo(Album):
    artist: str
    tracks: Optional[TracksEnvelope]
    listeners: int
    wiki: Optional[AlbumWiki]
    tags: TagsEnvelope


class ArtistTopAlbum(Album):
    mbid: str


class UserTopAlbum(Album):
    metadata: RankMetadata = pydantic.Field(alias="@attr")
    mbid: str


class TopAlbums(pydantic.BaseModel):
    metadata: PageMetadata = pydantic.Field(alias="@attr")


class ArtistTopAlbums(TopAlbums):
    albums: List[ArtistTopAlbum] = pydantic.Field(alias="album")


class UserTopAlbums(TopAlbums):
    albums: List[UserTopAlbum] = pydantic.Field(alias="album")


class AlbumInfoEnvelope(pydantic.BaseModel):
    album: AlbumInfo


class ArtistTopAlbumsEnvelope(pydantic.BaseModel):
    top_albums: ArtistTopAlbums = pydantic.Field(alias="topalbums")


class UserTopAlbumsEnvelope(pydantic.BaseModel):
    top_albums: UserTopAlbums = pydantic.Field(alias="topalbums")


class LastFMAPI:
    """Last.fm API interface.

    References:
    - https://www.last.fm/api
    """

    HTTP_METHOD = Literal["GET", "POST"]
    API_METHOD = Literal[
        "album.getInfo",
        "artist.getInfo",
        "artist.getTopAlbums",
        "artist.getTopTracks",
        "auth.getSession",
        "auth.getToken",
        "library.getArtists",
        "tag.getInfo",
        "track.getInfo",
        "user.getTopAlbums",
        "user.getTopArtists",
        "user.getTopTags",
        "user.getTopTracks",
        "user.getWeeklyAlbumChart",
        "user.getWeeklyArtistChart",
        "user.getWeeklyChartList",
        "user.getWeeklyTrackChart",
    ]
    PERIOD = Literal[
        "overall",
        "7day",
        "1month",
        "3month",
        "6month",
        "12month",
    ]

    def __init__(
        self,
        api_key: str,
        api_secret: str,
        username: str,
        *,
        api_root: str = "https://ws.audioscrobbler.com/2.0",
    ):
        self._api_root_url = urllib.parse.urlsplit(api_root.rstrip("/"))
        self._shared_secret = api_secret
        self._session = session = requests.Session()
        session.params["api_key"] = api_key
        session.params["format"] = "json"
        session.params["user"] = username

    def __del__(self):
        self._session.close()

    @property
    def url(self) -> str:
        return self._api_root_url.geturl()

    def get_album(self, mbid: str) -> AlbumInfo:
        if not mbid:
            raise ValueError("`mbid` is falsey")
        enveloped = self._get("album.getInfo", params={
            "mbid": str(mbid),
        }, schema=AlbumInfoEnvelope)
        return enveloped.album

    def get_user_top_albums(
        self,
        *,
        period: PERIOD = "overall",
        max_items: int = 50,
    ) -> Generator[UserTopAlbum, None, None]:
        if max_items <= 0:
            raise ValueError(
                "`max_items` must be greater than zero, not {max_items}",
            )
        item_count = 0
        for page_count in it.count(1):
            enveloped = self._get("user.getTopAlbums", params={
                "page": page_count,
                "period": period,
            }, schema=UserTopAlbumsEnvelope)
            albums = enveloped.top_albums.albums

            yield from it.islice(albums, 0, max(max_items - item_count, 0))
            item_count += len(albums)

            metadata = enveloped.top_albums.metadata
            if page_count >= metadata.total_pages:
                break
            elif item_count >= max_items:
                break

    def _get(self, api_method: API_METHOD, **kwargs) -> requests.Response:
        return self._request("GET", api_method=api_method, **kwargs)

    def _post(self, api_method: API_METHOD, **kwargs) -> requests.Response:
        return self._request("POST", api_method=api_method, **kwargs)

    def _request(
        self,
        http_method: HTTP_METHOD,
        *,
        api_method: API_METHOD,
        schema: pydantic.BaseModel,
        **kwargs,
    ) -> requests.Response:
        params = kwargs.setdefault("params", {})
        params["method"] = api_method
        response = self._session.request(http_method, self.url, **kwargs)
        response.raise_for_status()
        try:
            return schema.parse_raw(response.text)
        except pydantic.ValidationError:
            typer.echo("validation error for {response.text}")
            raise


if __name__ == "__main__":
    cli()

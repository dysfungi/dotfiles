FROM alpine:3.4

MAINTAINER Derek M. Frank <derekmfrank at gmail dot com>

USER root

# Install dependencies.
RUN apk update && apk add \
    bash \
    busybox-suid \
    git \
    sudo \
    zsh

# Add user.
ENV HOME "/home/dot"
ENV SHELL "/bin/zsh"
ENV USER "dot"
RUN addgroup "$USER"
RUN adduser -h $HOME -s "$SHELL" -G "$USER" -S -D "$USER"
RUN adduser "$USER" adm
RUN adduser "$USER" wheel
RUN adduser "$USER" sys
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/wheel

# Setup app.
ENV DOTFILES "$HOME/.dotfiles"
WORKDIR "$DOTFILES"
COPY . "$DOTFILES"
RUN chown -R "$USER:$USER" "$DOTFILES"

USER "$USER"
ENTRYPOINT ["./test/entrypoint.sh"]
CMD ["docker"]

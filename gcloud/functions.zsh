function gsedit() {
    # Positional arguments
    local remotefile="${1:?remote file is required}"

    local localfile="$(mktemp -d)/$(basename $remotefile)"

    local gs_opts=()
    local cp_opts=()

    if ! gsutil -m cp "$remotefile" "$localfile"; then
        local reply=?
        while : ; do
            read -q "reply?File does not exist.  Create? [y/n] "
            echo
            if [[ "$reply" = y* ]]; then
                break
            elif [[ "$reply" = n* ]]; then
                echo "Aborting..." >&2
                return 0
            else
                echo "Not a valid reply..." >&2
            fi
        done

        touch "$localfile"
        cp_opts+=(-n)  # no-clobber
    fi

    local checksum="$(sha256sum "$localfile")"

    if ! $EDITOR "$localfile"; then
        echo "Aborting due to editor return code" >&2
        return 2
    fi

    if [[ "$checksum" = "$(sha256sum "$localfile")" ]]; then
        echo "Skipping upload of unmodified file: $localfile" >&2
        return 0
    fi

    gsutil -m "${gs_opts[@]}" cp "${cp_opts[@]}" "$localfile" "$remotefile"
}

# https://wezfurlong.org/wezterm/config/lua/config/term.html
tempfile="$(mktemp)" \
  && curl -o "$tempfile" https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo \
  && tic -x -o "$HOME/.terminfo" "$tempfile" \
  && rm "$tempfile"

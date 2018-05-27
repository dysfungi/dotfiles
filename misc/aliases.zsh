alias starwars="telnet towel.blinkenlights.nl"

alias sitenamr="grep '^[a-z].*[^aeiou]er$' /usr/share/dict/words | shuf -n 1 | sed -r -e 's/er$/r/' -e 's/^(\w)/\1/'"
alias sitenamd="grep '^[a-z].*[^aeiou]ed$' /usr/share/dict/words | shuf -n 1 | sed -r -e 's/ed$/d/' -e 's/^(\w)/\1/'"

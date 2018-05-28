if hash todo.sh &>/dev/null; then
    alias t='todo.sh'
elif hash todotxt &>/dev/null; then
    alias t='todotxt'
fi

if type t &>/dev/null; then
    alias tl='t listall -@Readz'
    alias tlc='t listcon'
    alias tlp='t listproj'
    alias ta='t add'
    alias te='t edit'
fi

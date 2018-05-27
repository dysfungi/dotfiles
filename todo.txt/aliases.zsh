if iscmd todo.sh; then
    alias t='todo.sh'
elif iscmd todotxt; then
    alias t='todotxt'
fi

if iscmd t; then
    alias tl='t listall -@Readz'
    alias tlc='t listcon'
    alias tlp='t listproj'
    alias ta='t add'
    alias te='t edit'
fi

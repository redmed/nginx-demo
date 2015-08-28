#!/usr/bin/env bash
PID_PATH="logs/nginx.pid"
CONF="nginx.conf"

ps axw -o pid,ppid,user,%cpu,vsz,wchan,command | egrep '(nginx|PID)'
if [ -f "$PID_PATH" ]; then
    echo "Quit Nginx Process.."
    kill -QUIT `cat logs/nginx.pid`
fi

# nginx -s stop
echo "Start Nginx.."
nginx -c `pwd`/"$CONF"


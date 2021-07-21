#!/bin/bash

filter="(zsh|vi|mc)"
winpid=$(xprop -id $(xdotool getactivewindow) _NET_WM_PID|awk '{print $3}')

if [ -n "$winpid" ]; then 
    lpid=$(pstree -aApT ${winpid}|grep -E  "\\-${filter},[0-9]+" -o|tail -n1|awk -F, '{print $2}')
    if [ -n "${lpid}" ]; then
        #cd $(readlink /proc/${lpid}/cwd)
        cd $(readlink /proc/self/cwd)
    fi
fi

i3-sensible-terminal &

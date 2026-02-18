#!/bin/bash

status=$(rfkill list wifi | grep "Soft blocked: no")

if [[ -z $status ]]; then
    rfkill unblock wifi
else
    rfkill block wifi
fi

# refresh Waybar
pkill -RTMIN+1 waybar


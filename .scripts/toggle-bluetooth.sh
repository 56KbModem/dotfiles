#!/bin/bash

status=$(rfkill list bluetooth | grep "Soft blocked: no")
if [[ -z $status ]]; then
    rfkill unblock bluetooth
else
    rfkill block bluetooth
fi
pkill -RTMIN+1 waybar

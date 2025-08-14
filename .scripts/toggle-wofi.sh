#!/bin/bash

if pgrep -x wofi >/dev/null; then
    hyprctl dispatch focuswindow "wofi"
else
    wofi --show drun
fi


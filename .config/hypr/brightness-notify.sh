#!/bin/bash

# Get current brightness percentage (rounded)
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$(( brightness * 100 / max_brightness ))

# Choose icon based on brightness level
if [ "$percent" -ge 80 ]; then
    icon="🌞"
elif [ "$percent" -ge 40 ]; then
    icon="🌤️"
else
    icon="🌑"
fi

# Send notification with progress bar using dunstify
dunstify --timeout=2000 -a "brightness" "$icon Brightness" "$percent%" -h int:value:"$percent" -u low -r 9992

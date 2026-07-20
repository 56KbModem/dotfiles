#!/bin/bash

# Get current brightness percentage (rounded)
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$(( brightness * 100 / max_brightness ))

# Choose icon based on brightness level
if [ "$percent" -ge 70 ]; then
    icon="🌞"
elif [ "$percent" -ge 30 ]; then
    icon="🌤️"
else
    icon="🌑"
fi

# Send notification with progress bar using dunstify
#dunstify --timeout=2000 -a "brightness" "$icon Brightness" "$percent%" -h int:value:"$percent" -u low -r 9992

# brightness
ID_FILE="/tmp/notify-brightness.id"
ID=$(cat "$ID_FILE" 2>/dev/null)

NOTIFY_ID=$(notify-send --expire-time=2000 -a "brightness" -u low \
  -h int:value:"$percent" \
  --print-id ${ID:+--replace-id="$ID"} \
  "$icon Brightness" "$percent%")

echo "$NOTIFY_ID" > "$ID_FILE"

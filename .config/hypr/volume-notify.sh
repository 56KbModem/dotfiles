#!/bin/bash

# Get the current volume of the default audio output
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

# Check mute state (volume will be 0 even if muted, but we can detect mute explicitly if needed)
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo true || echo false)

# Choose icon or text based on mute status
if [ "$muted" = "true" ]; then
    icon="🔇"
    message="Muted"
    bar_value=0
else
    if [ "$volume" -ge 70 ]; then
        icon="🔊"
    elif [ "$volume" -ge 30 ]; then
        icon="🔉"
    else
        icon="🔈"
    fi
    message="$volume%"
    bar_value=$volume
fi

# volume
ID_FILE="/tmp/notify-volume.id"
ID=$(cat "$ID_FILE" 2>/dev/null)

NOTIFY_ID=$(notify-send --expire-time=2000 -a "volume" -u low \
  -h int:value:"$bar_value" \
  --print-id ${ID:+--replace-id="$ID"} \
  "$icon Volume" "$message")

echo "$NOTIFY_ID" > "$ID_FILE"

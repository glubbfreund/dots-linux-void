#!/bin/bash

# Do not run on system start
uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
if [ "$uptime_seconds" -lt 30 ]; then
    exit 0
fi

notify-send --app-name="darkman" --urgency=low --icon=weather-clear-night "Darmkan" "Zu Nachtmodus gewechselt."

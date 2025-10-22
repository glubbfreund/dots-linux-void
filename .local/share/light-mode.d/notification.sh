#!/bin/bash

# Nicht ausführen, wenn System kürzer als 2 Minuten läuft
uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
if [ "$uptime_seconds" -lt 30 ]; then
    exit 0
fi

notify-send --app-name="darkman" --urgency=low --icon=weather-clear "Darkman" "Zu hellem Modus gewechselt."

#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s Arc-Lighter
xfconf-query -c xfwm4 -p /general/theme -s Arc-Lighter

xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP/workspace0/last-image --set /home/oli/Bilder/Wallpaper/chapelatsea-day.jpg
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-2/workspace0/last-image --set /home/oli/Bilder/Wallpaper/chapelatsea-day.jpg

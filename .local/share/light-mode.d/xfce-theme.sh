#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s Arc-Lighter-Custom
xfconf-query -c xfwm4 -p /general/theme -s Arc-Lighter-Custom

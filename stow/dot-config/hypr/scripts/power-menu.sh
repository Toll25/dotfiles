#!/bin/env bash

# Define the options
options="⏻ Shutdown\n Reboot\n Lock\n󰒲 Suspend\n󰍃 Logout"

# Show the options using Fuzzel in dmenu mode and capture the selected option
selected=$(echo -e "$options" | fuzzel --lines=5 --width=15 --dmenu)

# Perform action based on selected option
case "$selected" in
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Lock")
        hyprlock
        ;;
    "󰒲 Suspend")
        systemctl suspend
        ;;
    "󰍃 Logout")
        hyprctl dispatch exit 1
        ;;
    *)
        ;;
esac

#!/usr/bin/env bash 

PATH_AC="/sys/class/power_supply/AC"
PATH_BATTERY_0="/sys/class/power_supply/BAT0"
PATH_BATTERY_1="/sys/class/power_supply/BAT1"

ac=0
battery_level_0=0
battery_level_1=0
battery_max_0=0
battery_max_1=0

if [ -f "$PATH_AC/online" ]; then
    ac=$(cat "$PATH_AC/online")
fi

if [ -f "$PATH_BATTERY_0/charge_now" ]; then
    battery_level_0=$(cat "$PATH_BATTERY_0/charge_now")
fi

if [ -f "$PATH_BATTERY_0/charge_full" ]; then
    battery_max_0=$(cat "$PATH_BATTERY_0/charge_full")
fi


battery_level=$(("$battery_level_0"))
battery_max=$(("$battery_max_0"))

battery_percent=$(("$battery_level * 100"))
battery_percent=$(("$battery_percent / $battery_max"))

if [ "$ac" -eq 1 ]; then
    if [ "$battery_percent" -gt 99 ]; then
        icon="󰂅 "
    elif [ "$battery_percent" -gt 90 ]; then
        icon="󰂊 "
    elif [ "$battery_percent" -gt 60 ]; then
        icon="󰂉 "
    elif [ "$battery_percent" -gt 35 ]; then
        icon="󰂈 "
    elif [ "$battery_percent" -gt 10 ]; then
        icon="󰂇 "
    else
        icon="󰂆 "
    fi
    

    if [ "$battery_percent" -gt 97 ]; then
        echo "%{B#2D3544}%{F#F28B04}%{T6}$icon"
    else
        echo "%{B#2D3544}%{F#F28B04}%{T6}$icon %{T-}$battery_percent%"
    fi
else
    if [ "$battery_percent" -gt 99 ]; then
        icon="󰁹"
    elif [ "$battery_percent" -gt 90 ]; then
        icon="󰂀";
    elif [ "$battery_percent" -gt 70 ]; then
        icon="󰁿"
    elif [ "$battery_percent" -gt 40 ]; then
        icon="󰁽"
    elif [ "$battery_percent" -gt 10 ]; then
        icon="󰁼"
    else
        icon="󰁺"
    fi

    echo "%{B#2D3544}%{F#F28B04}%{T6}$icon %{T-}$battery_percent%"
fi

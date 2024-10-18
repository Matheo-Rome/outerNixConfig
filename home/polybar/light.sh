#!/usr/bin/env bash 

MaxBright=$(cat /sys/class/backlight/intel_backlight/max_brightness)
CurrBright=$(cat /sys/class/backlight/intel_backlight/brightness)

MathBright=$((CurrBright * 100 / MaxBright))

icon="󰖨 ";
#if [ "$MathBright" -gt 90 ]; then
#    icon=" "
#elif [ "$MathBright" -gt 70 ]; then
#    icon=" "
#elif [ "$MathBright" -gt 40 ]; then
#    icon=" "
#elif [ "$MathBright" -gt 10 ]; then
#    icon=" "
#else
#    icon=" "
#fi

echo "%{B#2D3544}%{T6}%{F#2DC9FD}$icon %{T-}$MathBright%" 

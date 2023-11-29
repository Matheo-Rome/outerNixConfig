#!/usr/bin/env bash 

MON="eDP-2"    # Discover monitor name with: xrandr | grep " connected"

CurrBright=$( xrandr --verbose --current | grep ^"$MON" -A5 | tail -n1 )
CurrBright="${CurrBright##* }"  # Get brightness level with decimal place

Left=${CurrBright%%"."*}        # Extract left of decimal point
Right=${CurrBright#*"."}        # Extract right of decimal point

MathBright="0"
[[ "$Left" != 0 && "$STEP" -lt 10 ]] && STEP=10     # > 1.0, only .1 works
[[ "$Left" != 0 ]] && MathBright="$Left"00          # 1.0 becomes "100"
[[ "${#Right}" -eq 1 ]] && Right="$Right"0          # 0.5 becomes "50"
MathBright=$(( MathBright + Right ))

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

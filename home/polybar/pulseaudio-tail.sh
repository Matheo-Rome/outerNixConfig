#!/usr/bin/env bash

max_volum=100

update_sink() {
    sink=$(pacmd list-sinks | sed -n '/\* index:/ s/.*: //p')
}

volume_up() {
    update_sink
    vol=$(pamixer --sink "$sink" --get-volume)
    if [ $vol -lt $max_volum ] ; then
        pactl set-sink-volume "$sink" +1%
    else 
        pactl set-sink-volume "$sink" 100%
    fi
}

volume_down() {
    update_sink
    pactl set-sink-volume "$sink" -1%
}

volume_mute() {
    update_sink
    pactl set-sink-mute "$sink" toggle
}

volume_print() {
    update_sink

    active_port=$(pacmd list-sinks | sed -n "/index: $sink/,/index:/p" | grep active)
    vol=$(pamixer --sink "$sink" --get-volume)
    if [ $vol -le 25 ] ; then
        icon="";
    elif [ $vol -le 75 ]; then
        icon=""
    else
        icon="󰕾"
    fi

    muted=$(pamixer --sink "$sink" --get-mute)

    if [ "$muted" = true ]; then
        echo "%{B#2D3544}%{F#6DA05E}%{T3}"
    else
        echo "%{B#2D3544}%{F#6DA05E}%{T6}$icon %{T-}$(pamixer --sink "$sink" --get-volume)%"
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -qv "Client"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac

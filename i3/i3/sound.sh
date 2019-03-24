#!/usr/bin/env bash
set -x

CURR_SINK=`pacmd list-sinks | grep "* index" | awk '{print $3}'`
VALUE=$2
CURR_VOL=`pacmd list-sinks | awk '/^\svolume:/{i++} i=='$CURR_SINK'{print $5; exit}' | tr -d %`
MAX_VOL=150
if [[ "$VALUE" -eq '' ]]; then
    VALUE=5
fi


if [[ $1 == 'UP' && $CURR_VOL -lt $MAX_VOL ]]; then
    pactl set-sink-volume $CURR_SINK +$VALUE%
elif [[ $1 == 'DOWN' ]]; then
    pactl set-sink-volume $CURR_SINK -$VALUE%
elif [[ $1 == 'MUTE' ]]; then
    amixer -D pulse set Master 1+ toggle
fi
pkill -RTMIN+10 i3blocks

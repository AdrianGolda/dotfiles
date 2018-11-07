#!/usr/bin/env bash

CURR_SINK=`pacmd list-sinks | awk '/index:/{i++} /* index:/{print i; exit}'`
VALUE=$2
if [[ "$VALUE" -eq '' ]]; then
    VALUE=5
fi

if [[ $1 == 'UP' ]]; then
    pactl set-sink-volume $CURR_SINK +$VALUE%
elif [[ $1 == 'DOWN' ]]; then
    pactl set-sink-volume $CURR_SINK -$VALUE%
fi
pkill -RTMIN+10 i3blocks

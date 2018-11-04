#!/usr/bin/env sh

TOUCHPAD_ID=`xinput list | grep TouchPad | awk '{print $6}' | cut -d '=' -f 2`
TAPPING_ID=`xinput list-props $TOUCHPAD_ID | grep "Tapping Enabled" | head -n -1 | awk -F '[()]' '{print $2}'`
`xinput set-prop $TOUCHPAD_ID $TAPPING_ID 1`

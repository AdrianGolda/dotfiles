#!/bin/bash
cat $HOME/.config/i3/config.base \
    $HOME/.config/i3/config.local > $HOME/.config/i3/config
#exec /usr/bin/i3

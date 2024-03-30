#!/bin/bash

sleep 2
fcitx5 &

sleep 1
pulseaudio &
nm-applet &

# sleep 1
# /opt/clash_for_linux/cfw &

#!/bin/bash

sleep 1
cbatticon &
pulseaudio &

sleep 2
fcitx5 &
pasystray &

sleep 1
/opt/clash_for_linux/cfw &

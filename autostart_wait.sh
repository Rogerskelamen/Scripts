#!/bin/bash

sleep 1
fcitx5 &
cbatticon &

sleep 2
pulseaudio &
pasystray &

sleep 2
/opt/clash_for_linux/cfw &

#!/bin/bash

sleep 2
fcitx5 &
pasystray &

sleep 1
pulseaudio &

sleep 1
/opt/clash_for_linux/cfw &

#!/bin/bash

/bin/bash ~/Scripts/wp-autochange.sh &
picom --experimental-backends --config ~/.config/picom/picom.conf &
~/Scripts/autostart_wait.sh &

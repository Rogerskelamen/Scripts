#!/bin/bash

/bin/bash ~/Scripts/dwm-status-refresh.sh &
/bin/bash ~/Scripts/wp-autochange.sh &

light-locker &

picom --experimental-backends -b

~/Scripts/autostart_wait.sh &

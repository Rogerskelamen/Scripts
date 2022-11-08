#!/bin/bash

/bin/bash ~/Scripts/wp-autochange.sh &
picom --experimental-backends -b
~/Scripts/autostart_wait.sh &

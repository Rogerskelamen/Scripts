#!/bin/bash

wallpaper_path=~/Pictures/wallpapers/ai-images

# Store wallpapers
wallpapers=($(find $wallpaper_path -type f))

# Find number of wallpaper files
nr_wallpaper=$(find $wallpaper_path -type f | wc -l)

# Number array [1~nr_wallpaper]
nr_arr=($(shuf -i 1-$nr_wallpaper -n $nr_wallpaper))

swww img -t wipe ${wallpapers[${nr_arr[$1 % $nr_wallpaper]}]}

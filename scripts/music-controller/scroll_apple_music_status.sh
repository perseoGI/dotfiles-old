#!/bin/bash

# Based on: https://github.com/PrayagS/polybar-spotify

zscroll -l 30 \
        --delay 0.1 \
        --match-command "playerctl --player=playerctld status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true '/home/perseo/scripts/music-controller/get_apple_music_status.sh' &

wait

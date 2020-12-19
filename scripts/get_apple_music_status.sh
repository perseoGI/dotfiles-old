#!/bin/bash

# Based on: https://github.com/PrayagS/polybar-spotify

if [ "$(playerctl --player=playerctld status)" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$(playerctl --player=playerctld status)" = "Paused"  ]; then
    # Send ipc message to all polybars in order to change play-pause icon
    polybar-msg hook apple-music-play-pause 2 1>/dev/null 2>&1
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg hook apple-music-play-pause 1 1>/dev/null 2>&1
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
fi

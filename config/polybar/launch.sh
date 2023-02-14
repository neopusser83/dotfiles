#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

CONFIG="config.2.ini"

#RES=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
RES=1366

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
if [[ $RES == 1366 ]]
then
polybar -q main1 -c "$DIR"/"$CONFIG" &
polybar -q main2 -c "$DIR"/"$CONFIG" &
polybar -q main3 -c "$DIR"/"$CONFIG" &
polybar -q main4 -c "$DIR"/"$CONFIG" &
polybar -q main5 -c "$DIR"/"$CONFIG" &
polybar -q main6 -c "$DIR"/"$CONFIG" &
polybar -q main7 -c "$DIR"/"$CONFIG" &
fi

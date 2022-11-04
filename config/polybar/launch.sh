#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main1 -c "$DIR"/config.ini &
polybar -q main2 -c "$DIR"/config.ini &
polybar -q main3 -c "$DIR"/config.ini &
polybar -q main4 -c "$DIR"/config.ini &
polybar -q main5 -c "$DIR"/config.ini &
polybar -q main6 -c "$DIR"/config.ini &
polybar -q main7 -c "$DIR"/config.ini &
polybar -q main8 -c "$DIR"/config.ini &
polybar -q main9 -c "$DIR"/config.ini &
polybar -q main10 -c "$DIR"/config.ini &
polybar -q main11 -c "$DIR"/config.ini &


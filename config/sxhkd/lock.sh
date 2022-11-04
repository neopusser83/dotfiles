#!/bin/bash
killall picom

desktop=$(bspc query -D -d focused --names)
#bspc desktop -f 11
slimlock
#bspc desktop -f $desktop
picom &


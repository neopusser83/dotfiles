#terminator &
xrdb -merge .Xresources
xsetroot -cursor_name left_ptr
WALLP=$(cat .config/bspwm/current_wallpaper)
hsetroot -cover $WALLP
.local/bin/wal -i $WALLP -a 92 -n
start-pulseaudio-x11
exec dbus-run-session bspwm

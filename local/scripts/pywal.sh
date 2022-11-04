#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/rofi/launchers/colorful/colors.rasi"
BFILE="$HOME/.config/bspwm/bspwmrc"
DFILE="$HOME/.config/dunst/dunstrc"
SFILE="$HOME/.config/spicetify/Themes/BurntSienna/color.ini"

# Oomox scripts
OMT='/opt/oomox/plugins/theme_oomox/change_color.sh'
OMI='/opt/oomox/plugins/icons_papirus/change_color.sh'

# Pywal binary
PYWAL="$HOME/.local/bin/wal"

# Spicetify binary
SPICETIFY='spicetify'

# Get colors
pywal_get() {
	$PYWAL -i $1 -q -t -a 92
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE

	#bspwm
        sed -i -e "s/bspc config focused_border_color '#.*/bspc config focused_border_color '$FGA'/g" $BFILE
        sed -i -e "s/bspc config normal_border_color '#.*/bspc config normal_border_color '$BG'/g" $BFILE
        sed -i -e "s/bspc config active_border_color '#.*/bspc config active_border_color '$BG'/g" $BFILE

	#dunst
	sed -i -e "s/background = \"#.*/background = \"$BG\"/g" $DFILE
        sed -i -e "s/foreground = \"#.*/foreground = \"$FGA\"/g" $DFILE
	sed -i -e "s/frame_color = \"#.*/frame_color = \"$FGA\"/g" $DFILE

	#Spicetify
        sed -i -e "s/text = .*/text = $(echo $FGA | sed 's/#//')/g" $SFILE
	sed -i -e "s/subtext = .*/subtext = $(echo $SUB | sed 's/#//')/g" $SFILE
	sed -i -e "s/button-text = .*/button-text = $(echo $BG | sed 's/#//')/g" $SFILE
	sed -i -e "s/main = .*/main = $(echo $BG | sed 's/#//')/g" $SFILE
	sed -i -e "s/sidebar = .*/sidebar = $(echo $BG | sed 's/#//')/g" $SFILE
	sed -i -e "s/button = .*/button = $(echo $SH9 | sed 's/#//')/g" $SFILE
        sed -i -e "s/button-active = .*/button-active = $(echo $SH9 | sed 's/#//')/g" $SFILE
        sed -i -e "s/player = .*/player = $(echo $BG | sed 's/#//')/g" $SFILE
        sed -i -e "s/card = .*/card = $(echo $BG | sed 's/#//')/g" $SFILE
        sed -i -e "s/shadow = .*/shadow = $(echo $BG | sed 's/#//')/g" $SFILE
        sed -i -e "s/tab-active = .*/tab-active = $(echo $BG | sed 's/#//')/g" $SFILE
        sed -i -e "s/notification = .*/notification = $(echo $SH1 | sed 's/#//')/g" $SFILE
        sed -i -e "s/notification-error = .*/notification-error = $(echo $SH1 | sed 's/#//')/g" $SFILE
        sed -i -e "s/button-disabled = .*/button-disabled = $(echo $SUB | sed 's/#//')/g" $SFILE
        sed -i -e "s/subbutton-text = .*/subbutton-text = $(echo $SUB | sed 's/#//')/g" $SFILE
        sed -i -e "s/selected-row = .*/selected-row = $(echo $SH5 | sed 's/#//')/g" $SFILE
        sed -i -e "s/sub-button = .*/sub-button = $(echo $SH9 | sed 's/#//')/g" $SFILE
        sed -i -e "s/misc = .*/misc = $(echo $FGA | sed 's/#//')/g" $SFILE
        sed -i -e "s/playback-bar = .*/playback-bar = $(echo $SH9 | sed 's/#//')/g" $SFILE

	#update polybar, dunst, spotify and bspwm colors
	polybar-msg cmd restart
	xdo lower -N Polybar
	bspc config active_border_color $BG
	bspc config normal_border_color $BG
	bspc config focused_border_color $FGA
	killall dunst;dunst &
	cp $HOME/.cache/wal/colors-rofi-dark.rasi $HOME/.config/rofi/config.rasi
        $OMT -o wal $HOME/.cache/wal/colors-oomox
       	$OMI -o papirus-wal $HOME/.cache/wal/colors-oomox

	$SPICETIFY apply -n
	notify-send "Wallpaper set successfully!"
}

# Main
if [[ -f $PYWAL ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$color0"`
		FGA=`printf "%s\n" "$color7"`
		SH1=`printf "%s\n" "$color1"`
		SH2=`printf "%s\n" "$color2"`
		SH3=`printf "%s\n" "$color1"`
		SH4=`printf "%s\n" "$color2"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color2"`
                SUB=`printf "%s\n" "$color8"`
		SH9=`printf "%s\n" "$color3"`
		NOT=`printf "%s\n" "$color15"`

		change_color
	          echo $(pwd)/$1 > $HOME/.config/bspwm/current_wallpaper

	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : $0 path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi

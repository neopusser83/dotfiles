#/bin/bash
stat=$(setxkbmap -query | grep layout)

if [[ $stat == "layout:     us" ]]
  then
	setxkbmap es
elif [[ $stat != "layout:     us" ]]
  then
	setxkbmap us
  fi

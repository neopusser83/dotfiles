#/bin/bash
stat=$(pamixer --get-volume-human)

if [[ $stat == "muted" ]]
  then
	pamixer -u
elif [[ $stat != "muted" ]]
  then
	pamixer -m
  fi

#!/bin/bash

bg="#e5e5e5ff"
inactivebg="#e0e0e0ff"
border="#e5e5e5ff"
inactiveborder="#e0e0e0ff"
text="#333333ff"
inactivetext="#bbbbbbff"
urgentbg="#cc0856ff"
indicator="#e5e5e5ff"

green=#42f47dee
red=#f4424bff
blue=#4286f4ee

BG=/home/archie/.wallpaper
NEWBG=/tmp/lockscreen.png

[[ ! -f "$NEWBG" ]] && /usr/bin/convert -resize 1920x1080\! "$BG" "$NEWBG"

i3lock \
	-i "$NEWBG" \
	--timepos="x+110:h-70" \
	--datepos="x+130:h-45" \
	--clock --datestr "$(date +"%A %d %B %Y")" \
	--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
	--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
	--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
	--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
	--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
	--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
	--noinputtext="" --force-clock --indicator -n

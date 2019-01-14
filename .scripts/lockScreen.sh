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

TMPBG=/tmp/screen.jpg
ICON=$HOME/.icons/locksmall.png
currentwallpaper=$(cat /home/archie/.config/wallpaperChanger/currentWallpaper | awk '{gsub("file://", ""); print $0}')
isDifferent=$(diff "$currentwallpaper" $TMPBG | grep differ)
NEWBG=/tmp/screen2.jpg

if [[ ! -f $TMPBG ]]
then
    touch $TMPBG
fi

if [[ $isDifferent == "differ" ]] || [[ ! -f $NEWBG ]]
then
	cp "$currentwallpaper" $TMPBG
	convert $TMPBG -resize 1366x768^ $TMPBG
	convert $TMPBG -blur 0x8 $NEWBG
	convert $NEWBG -fill black -colorize 40 $NEWBG
	convert $NEWBG $ICON -gravity center -composite -matte $NEWBG
fi


#	Do some cool things
##Pixellate
##convert $TMPBG -scale 10% -scale 1000% $TMPBG
#
##Blur

if [[ $(/home/archie/.scripts/mpdstatus) == "playing" ]]
then
	# Avoids messing with fullscreen firefox.
	i3-msg workspace number 2
	urxvt -e ncmpcpp -s visualizer &
	sleep 0.2

	i3-msg fullscreen

	i3lock \
		-t -i "$NEWBG" \
		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
		--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
		--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
		--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
		--verifcolor="$green" --noinputtext="" --indicator -n; i3-msg kill
else
	i3-msg workspace number 2
	urxvt -e cmatrix -b -a -u 2 -o -C cyan &
	sleep 0.2
	i3-msg fullscreen

	i3lock \
		-t -i "$NEWBG" \
		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
		--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
		--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
		--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
		--verifcolor="$green" --noinputtext="" --indicator -n; i3-msg kill
fi

# NO BACKGROUND PROGRAM:
# i3lock \
# 	-t -i "$NEWBG" \
# 	--timepos="x+110:h-70" \
# 	--datepos="x+130:h-45" \
# 	--clock --datestr "$(date +"%A %d %B %Y")" \
# 	--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
# 	--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
# 	--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
# 	--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
# 	--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
# 	--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
# 	--noinputtext="" --force-clock --indicator -n & sleep 0.1; transset-df -n i3lock 2 -x 2

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
isDifferent=$(diff $currentwallpaper $TMPBG)
NEWBG=/tmp/screen2.jpg

if [[ ! -f $TMPBG ]]
then
    touch $TMPBG
fi

if [[ $isDifferent != "" ]] || [[ ! -f $NEWBG ]]
then
	cp $currentwallpaper $TMPBG
	convert $TMPBG -resize 1366x768^ $TMPBG
	convert $TMPBG -blur 0x8 $NEWBG
	convert $NEWBG -fill black -colorize 40 $NEWBG
	convert $NEWBG $ICON -gravity center -composite -matte $NEWBG
fi

#scrot /tmp/screen.png

#	Do some cool things
##Pixellate
##convert $TMPBG -scale 10% -scale 1000% $TMPBG
#
##Blur

i3lock \
		-t -i "$NEWBG" \
		--timepos="x+110:h-70" \
		--datepos="x+135:h-45" \
		--clock --datestr "$(date +"%A %d %B %Y")" \
		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
		--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
		--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
		--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
		--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
		--noinputtext="" --force-clock --indicator -n


#i3lock \
#		-t -i "$TMPBG" \
#		--timepos="x+110:h-70" \
#		--datepos="x+135:h-45" \
#		--clock --datestr "Type password to unlock..." \
#		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
#		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$text \
#		--insidevercolor=$blue --insidewrongcolor=$red \
#		--ringvercolor=$text --ringwrongcolor=$text --indpos="x+280:h-70" \
#		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
#		--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
#		--noinputtext="" --force-clock -n

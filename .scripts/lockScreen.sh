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

TMPBG=/home/archie/.config/lockScreen/screen.png
ICON=$HOME/.icons/locksmall4.png
cp $ICON /home/archie/.config/lockScreen/icon.png
RICON=/home/archie/.config/lockScreen/icon.png
NEWBG=/home/archie/.config/lockScreen/screen2.png
currentwallpaper=/home/archie/.config/lockScreen/cw

if [[ ! -f $currentwallpaper ]]
then
	cp /home/archie/.config/wallpaperChanger/currentWallpaper /home/archie/.config/lockScreen/cw
	currentwallpaper=/home/archie/.config/lockScreen/cw
fi

if [[ ! -f $TMPBG ]]
then
	cp "$(cat $currentwallpaper)" $TMPBG
fi

isDifferent=$(diff "$currentwallpaper" /home/archie/.config/wallpaperChanger/currentWallpaper >> /dev/null;echo $?)

if [[ $isDifferent != "0" ]] || [[ ! -f $NEWBG ]]
then
	cp /home/archie/.config/wallpaperChanger/currentWallpaper $currentwallpaper
	cp "$(cat $currentwallpaper)" $TMPBG
	convert $TMPBG -resize 1366x768\! $NEWBG
	# convert $NEWBG -blur 8x8 $NEWBG
	# convert $NEWBG -scale 20% -scale 500% $NEWBG
	convert $NEWBG -fill black -colorize 40 $NEWBG
	convert $NEWBG -colorspace gray $NEWBG
	convert $RICON -resize 220x220\! $RICON
	convert $NEWBG $RICON -gravity center -composite -matte $NEWBG
fi


#	Do some cool things
##Pixellate
#
##Blur

# if [[ $(/home/archie/.scripts/mpdstatus) == "playing" ]]
# then
# 	# Avoids messing with fullscreen firefox.
# 	i3-msg workspace number 11
# 	i3-msg split v
# 	urxvt -e ncmpcpp -s visualizer &
# 	sleep 0.2
#
# 	i3lock \
# 		-t -i "$NEWBG" \
# 		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
# 		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
# 		--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
# 		--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
# 		--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
# 		--verifcolor="$green" --noinputtext="" --indicator -n; i3-msg kill; i3-msg kill; i3-msg kill;
# else
# 	i3lock \
# 		-t -i "$NEWBG" \
# 		--timepos="x+110:h-70" \
# 		--datepos="x+130:h-45" \
# 		--clock --datestr "$(date +"%A %d %B %Y")" \
# 		--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
# 		--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
# 		--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
# 		--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
# 		--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
# 		--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
# 		--noinputtext="" --force-clock --indicator -n & sleep 0.1; transset-df -n i3lock 2 -x 2
# fi

i3lock \
	-t -i "$NEWBG" \
	--timepos="x+110:h-70" \
	--datepos="x+130:h-45" \
	--clock --datestr "$(date +"%A %d %B %Y")" \
	--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
	--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
	--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
	--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
	--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
	--verifcolor="$green" --timecolor="$bg" --datecolor="$bg" \
	--noinputtext="" --force-clock --indicator -n & sleep 0.1; transset-df -n i3lock 2 -x 2
#Cmatrix
# i3-msg workspace number 11
# urxvt -e cmatrix -b -a -u 2 -o -C cyan &
# sleep 0.2
# i3-msg fullscreen
#
# i3lock \
# 	-t -i "$NEWBG" \
# 	--insidecolor=#00000000 --ringcolor=$bg --line-uses-inside \
# 	--keyhlcolor=$blue --bshlcolor=$red --separatorcolor=$bg \
# 	--insidevercolor=#00000000 --insidewrongcolor=#00000000 \
# 	--ringvercolor=$blue --ringwrongcolor=$red --indpos="(w/2):(h/2)" \
# 	--radius=110 --ring-width=3 --veriftext="" --wrongtext="" \
# 	--verifcolor="$green" --noinputtext="" --indicator -n; i3-msg kill
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

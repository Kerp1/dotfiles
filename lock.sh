#!/bin/bash

# https://github.com/meskarune/i3lock-fancy/

# Dependencies:
# imagemagick
# i3lock-color-git
# scrot

#IMAGE=/tmp/i3lock.png
#BLURTYPE="4x6"

#scrot $IMAGE
notify-send "Locking..."
#convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE $IMAGE
#i3lock -u -i $IMAGE


#!/bin/bash
  
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

if [[ -f $HOME/.config/screen-lock.png ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file ~/.config/screen-lock.png | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert /tmp/screen.png $HOME/.config/screen-lock.png -geometry +704+284 -composite -matte  /tmp/screen.png
    done
fi
# i3lock  -I 10 -d -e -u -n -i /tmp/screen.png
# playerctl pause spotify
i3lock -e -n -u -i /tmp/screen.png

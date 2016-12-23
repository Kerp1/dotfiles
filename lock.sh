#!/bin/bash

# https://github.com/meskarune/i3lock-fancy/

# Dependencies:
# imagemagick
# i3lock-color-git
# scrot

IMAGE=/tmp/i3lock.png
BLURTYPE="4x6"

scrot $IMAGE
notify-send "Locking..."
convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE $IMAGE
i3lock -u -i $IMAGE

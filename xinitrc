#/bin/sh
setxkbmap se
xrdb -merge ~/.Xdefaults 
feh --bg-scale ~/Pictures/background.jpg 
xset r rate 275 50  
twmnd &
exec i3

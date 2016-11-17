#/bin/sh
setxkbmap se
xrdb -merge ~/.Xdefaults 
feh --bg-scale ~/Pictures/background.jpg 
xset r rate 275 50  
twmnd &
udiskie &
exec i3

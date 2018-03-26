#/bin/sh
#setxkbmap se
xrdb -merge ~/.Xdefaults 
feh --bg-scale ~/Pictures/background.jpg 
xset r rate 275 50  
twmnd &
udiskie &
srandrd "/home/kerp/.dotfiles/config/screenconfig/screenconfig"
#env KEYBASE_START_UI=hideWindow run_keybase &
exec i3

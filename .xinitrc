#!/bin/sh

xset r rate 300 30 &
# picom --vsync --backend glx --inactive-dim 0.2 --no-fading-openclose --inactive-dim-fixed --config /dev/null --focus-exclude "x = 0 && y = 0 && override_redirect = true" &
picom &
setxkbmap -option ctrl:swapcaps &
# setxkbmap -option caps:escape &
~/.config/suckless/bar/bar.sh &
~/.tmux/scrpad.sh &
# dwmblocks &
# feh --bg-scale /home/pavel/Pictures/wall/persey.jpg
flameshot &
pgrep copyq || copyq --start-server && copyq hide


while true; do 
  dwm 2> ~/.dwm.log
done

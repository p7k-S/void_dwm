#!/bin/sh

# picom --vsync --backend glx --inactive-dim 0.2 --no-fading-openclose --inactive-dim-fixed --config /dev/null --focus-exclude "x = 0 && y = 0 && override_redirect = true" &
# setxkbmap -option caps:escape &
xset r rate 300 30 &
picom &
setxkbmap -option ctrl:swapcaps &
~/.config/suckless/bar/bar_neo.sh &
~/.config/suckless/bar/brightness_warn_dec.sh &
# dwmblocks &
# ~/.tmux/scrpad.sh &
# feh --bg-scale /home/pavel/Pictures/Wallpapers/pix/walle.jpg
feh --bg-scale /home/pavel/Pictures/Wallpapers/leaf.jpg
# polybar &
flameshot &
# dunst &
pgrep copyq || copyq --start-server && copyq hide


while true; do 
  dwm 2> ~/.dwm.log
done

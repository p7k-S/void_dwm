#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/suckless/bar/bar_themes/gruvchad

bluetooth () {
    COMMAND="$(ps -e | grep 'bluetoothd' | tail -c2)"

    case "$COMMAND" in
     "d") printf "^c$darkblue^ ^d^%s" "^c$darkblue^$(bluetoothctl info | grep Name: | sed 's/^[[:space:]]*//g' | sed -e "s/ //g" | sed 's/Name://g') " ;;
      *) 
        printf "" ;;
    esac
}

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf " ^c$green^  $cpu_val"
}

pkg_updates() {
  # updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  updates=$(xbps-install -un | wc -l) # void
  printf " ^c$green^   $updates"
  # printf "  ^c$green^   $updates"" updates"
  #updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  # updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)  # apt (ubuntu, debian etc)
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$white^   "
  printf "^c$white^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

# mic () {
#     status="$(pactl list | sed -n '/^Source/,/^$/p' | grep Mute | grep yes)"
#
#     if [[ $status  ]]; then
#       printf "^c$blue^ "$(pactl list | sed -n '/^Source/,/^$/p' | grep yes | wc -l)"  "
#     else
#       printf "^c$blue^  "
#     fi
#
# }
mic () {
    COMMAND="$(pactl list | sed -n '/^Source/,/^$/p' | grep Mute | grep yes | tail -c2)"

    case "$COMMAND" in
     "s") printf "^c$blue^ "$(pactl list | sed -n '/^Source/,/^$/p' | grep yes | wc -l)"  " ;;
      *) printf "^c$red^  " ;;
    esac
}

vol() {
  vol="$(pamixer --get-volume)"
  printf "%s %s\\n" "^c$blue^$vol%"
}

mem() {
  printf "^c$blue^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

dwm_keyboard () {
  COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

  case "$COMMAND" in

   "00000000"|"00000001") LAYOUT="US" ;;

   "00001000"|"00001001") LAYOUT="RU" ;;

    *) LAYOUT="??" ;;

  esac

  printf "^c$red^ $LAYOUT "
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$green^ 󰤨 ^d^%s" " ^c$green^$(iwctl station wlp4s0 show | grep "Connected network" | awk '{print $NF}') " ;;
	down) printf "^c$red^ 󰤭 ^d^%s" " ^c$red^Disconnected " ;;
	esac
}

clock() {
	printf "^ c$white^󱑆 "
	printf "^c$white^$(date '+%H:%M')  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(dwm_keyboard)$(mic)$(vol)$(bluetooth)$(cpu) $(mem) $(wlan) $(clock)"
done

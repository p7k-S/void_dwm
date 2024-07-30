#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/suckless/bar/bar_themes/gruvchad

bluetooth () {
    COMMAND="$(ps -e | grep 'bluetoothd' | tail -c2)"

    case "$COMMAND" in
     "d") printf "^d^ ^b#458588^^c#1d2021^  ^b#83a598^ ^d^%s" "^b#83a598^^c#1d2021^$(bluetoothctl info | grep Name: | sed 's/^[[:space:]]*//g' | sed -e "s/ //g" | sed 's/Name://g') " ;;
      *) 
        printf "" ;;
    esac
}

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  printf "^d^ ^b#d65d0e^^c#1d2021^   ^b#fe8019^ $cpu_val "
}

temp() {
  # printf "^d^ ^b#cc241d^^c#1d2021^  ^b#fb4934^ $(paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/' | awk '{print $2}')"
  printf "^d^ ^b#cc241d^^c#1d2021^  ^b#fb4934^ $(cat /sys/class/thermal/thermal_zone0/temp | sed 's/\(.\)..$/.\1°C/')"
}

pkg_updates() {
  # updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  updates="$(xbps-install -un | wc -l)" # void
  printf "^d^ ^b#d65d0e^^c#1d2021^   ^b#fe8019^ $updates"
  # printf "  ^c$green^   $updates"" updates"
  #updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  # updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)  # apt (ubuntu, debian etc)
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^d^ ^b#d79921^^c#1d2021^   ^b#fabd2f^ $get_capacity"
}

brightness() {
  printf "^d^ ^b#cc241d^^c#1d2021^   ^b#fb4934^ %.0f\n" $(cat /sys/class/backlight/*/brightness)
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
     "s") printf "^d^^c$black^ ^b$darkblue^ "$(pactl list | sed -n '/^Source/,/^$/p' | grep yes | wc -l)" ^b$blue^ " ;;
      *) printf "^d^ ^c$blue^  " ;;
    esac
}

vol() {
  vol="$(pamixer --get-volume)"
  printf "%s %s\\n" "$vol%"
}

mem() {
  printf "^d^ ^b#98971a^^c#1d2021^   "
  printf "^b#b8bb26^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

dwm_keyboard () {
  COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

  case "$COMMAND" in

   "00000000"|"00000001") LAYOUT="US" ;;

   "00001000"|"00001001") LAYOUT="RU" ;;

    *) LAYOUT="??" ;;

  esac

  printf "^d^ ^b#b16286^^c#1d2021^   ^b#d3869b^ $LAYOUT "
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^d^ ^b#689d6a^^c#1d2021^ 󰤨  ^b#8ec07c^ $(iwctl station wlp4s0 show | grep "Connected network" | awk '{print $NF}')" ;;
	down) printf "^d^ ^b#cc241d^^c#1d2021^ 󰤭  ^b#fb4934^ Disconnected" ;;
	esac
}

clock() {
	printf "^d^^c$black^ ^b$darkblue^ 󱑆  "
	printf "^c$black^^b$blue^ $(date '+%H:%M') ^d^ "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  # sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(dwm_keyboard)$(mic)$(vol)$(bluetooth)$(cpu)$(temp) $(mem) $(wlan) $(clock)"
  sleep 1 && xsetroot -name "$(battery) $(mic)$(vol)$(bluetooth) $(wlan) $(clock)"
done

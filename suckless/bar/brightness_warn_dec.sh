#!/bin/bash

brightness () {
    flag_file="/tmp/battery_brightness_flag"

    # Проверяем, существует ли файл-флаг
    if [ -f "$flag_file" ]; then
        exit 0
    fi

    battery_capacity=$(cat /sys/class/power_supply/BAT1/capacity)

    if [ "$battery_capacity" -lt 15 ]; then
        brightnessctl -c backlight set 0%
        touch "$flag_file"
    fi
}

while true; do
  sleep 60 && brightness
done

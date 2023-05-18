#!/bin/bash

print_volume() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 50
	then
		echo -e "🔊$volume%"
	elif test "$volume" -gt 20
	then
		echo -e "🔉$volume%"
	elif test "$volume" -gt 0
	then
		echo -e "🔈$volume%"
	else
		echo -e "🔇Mute"
	fi
}

print_mem() {
	let memusage=$(free | awk '(NR==2){ print $3 }')
	let memshared=$(free | awk '(NR==2){ print $5 }')
	echo $((
		($memusage+$memshared) / 1024
	))
}

print_temp() {
	sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp
}

get_battery_percentage() {
	percentage=$(acpi -b | awk '{print $4}' | tr -d ',')
	if [[ "$percentage" == "charging" ]]
	then
		echo "100%";
	else
		echo $percentage;
	fi
}

get_battery_charging_status() {

	if $(acpi -b | grep --quiet Discharging)
	then
		echo "🔋";
	else # acpi can give Unknown or Charging if charging, https://unix.stackexchange.com/questions/203741/lenovo-t440s-battery-status-unknown-but-charging
		echo "🔌";
	fi
}

print_bat() {
	echo "$(get_battery_charging_status) $(get_battery_percentage)"
}

print_date() {
	date +"%m月%d日 %a %H:%M" | sed 's/Mon/周一/; s/Tue/周二/; s/Wed/周三/; s/Thu/周四/; s/Fri/周五/; s/Sat/周六/; s/Sun/周日/'
}

xsetroot -name " $(print_mem)M $(print_temp) $(print_volume) [ $(print_bat) ] $(print_date) "

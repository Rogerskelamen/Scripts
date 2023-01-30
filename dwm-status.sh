print_volume() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 0
	then
		echo -e "$volume"
	else
		echo -e "婢Mute"
	fi
}

print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$memfree"
}

get_battery_percentage() {
	percentage=$(acpi -b | awk '{print $4}' | tr -d ',')
	if [[ "$percentage" == "charging" ]];
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
	date '+%Y年%m月%d日 %H:%M'
}

xsetroot -name "$(print_mem)M $(print_volume) [ $(print_bat) ] $(print_date) "

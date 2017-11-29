#!/bin/bash
#
# low battery warning
#

battery=/sys/class/power_supply/BAT0

percent=`grep "POWER_SUPPLY_CAPACITY=" $battery/uevent | awk -F= '{ print $2 }'`
discharging=`grep "POWER_SUPPLY_STATUS=" $battery/uevent | awk -F= '{ print $2 }'`

if [ $discharging == "Discharging" ] && [ $percent -le "15" ]; then
	notify-send Battery "Low Battery"
fi

exit 0

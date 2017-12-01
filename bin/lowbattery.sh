#!/bin/bash
#
# low battery warning
#

discharging=`acpi --details | head -n1 | cut -d':' -f2 | cut -d',' -f1 | sed -e 's/^\s*//g'`
percent=`acpi --details | head -n1 | sed -e 's/.*\s\([0-9]\+\)%.*/\1/'`


if [ $discharging == "Discharging" ] && [ $percent -le 15 ]; then
	remaining=`acpi --details | head -n1 | sed -e 's/.*\([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\).*/\1/'`
	notify-send Battery "Low Battery $remaining"
fi

exit 0

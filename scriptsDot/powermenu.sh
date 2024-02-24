#!/bin/bash

# Define the options for the power menu
options="Shutdown\nReboot\nSuspend\nLogout"

# Use rofi to display the options and get the user's choice
choice=$(echo -e "$options" | tofi)

# Execute the chosen action based on the user's choice
case $choice in
"Shutdown")
	systemctl poweroff
	;;
"Reboot")
	systemctl reboot
	;;
"Suspend")
	systemctl suspend
	;;
"Logout")
	pkill -KILL -u "$USER"
	;;
*)
	echo "Invalid option: $choice"
	;;
esac

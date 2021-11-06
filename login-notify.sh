#!/bin/bash

# prepare any message you want
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%d/%m/%Y %H:%M:%S")"
login_name="$(whoami)"
ipAddress=$(hostname -I)

# For new line I use $'\n' here
message="SSH"$'\n'"User : $login_name"$'\n'"From : $login_ip"$'\n'"Dest : $ipAddress $'\n'"$login_date"

#send it to telegram
telegram-send "$message"

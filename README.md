# Bash-Script-Telegram-Notify

Taken from Konstantin Bogomolov site (https://bogomolov.tech/Telegram-notification-on-SSH-login/)

After create [telegram-send file](https://github.com/purwo-martono/telegram-send), we will try to use it on Ubuntu Linux as a notify everytime user login


### Send notification on SSH login

All files with .sh extension in /etc/profile.d/ folder will be executed whenever a bash login shell is entered or the desktop session loads.


##### Let’s add a new script to send the notification.
```
touch login-notify.sh
```


##### Add this code to script
```
#!/bin/bash
    
# prepare any message you want
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%e %b %Y, %a %r")"
login_name="$(whoami)"

# For new line I use $'\n' here
message="New login to server"$'\n'"$login_name"$'\n'"$login_ip"$'\n'"$login_date"

#send it to telegram
telegram-send "$message"
```


##### Then move this script to /etc/profile.d/ folder
```
sudo mv login-notify.sh /etc/profile.d/login-notify.sh
```


##### Now re-login to your web server and check it works.



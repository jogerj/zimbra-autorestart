# zimbra-autorestart

Auto restart zimbra if something stops working, because some zimbra services likes to stop working randomly for absolutely no reason and restarting (some) services fixes it. This is a cure-all solution I came up with. Prevent consecutive restart if last restart didn't fix the problem. Also send a Pushbullet notification on restart/reboot.

## Setup

1. Ideally put this in your `/root` home folder, otherwise replace each `source /path/to/pushbullet.sh` for each script
2. Create an [Access Token for Pushbullet](https://www.pushbullet.com/#settings/account) and put in `pushbullet.sh`. This is not necessary if you don't want to use Pushbullet.
3. Setup cronjob:

    ```
    0 * * * * bash /root/auto_restart.sh
    @reboot bash /root/notify_reboot.sh
    ```

4. `chmod 500 /root/pushbullet.sh` to prevent access token leak. Same goes with other files to be safe.

## Example pushes

**mail.example.com (zimbra restart)**
```
Fri, 11 Feb 2022 10:13:00 +0100
	antivirus               Stopped
Zimbra was restarted
up 3 hours, 45 minutes
```

**mail.example.com (zimbra restart)**
```
Fri, 11 Feb 2022 10:15:21 +0100
	antivirus               Stopped
Zimbra restart failed to solve problem!
up 3 hours, 47 minutes
```

**mail.example.com (reboot)**
```
Fri, 11 Feb 2022 09:58:16 +0100
reboot   system boot  4.15.0-167-gener Fri Feb 11 09:57   still running
reboot   system boot  4.15.0-167-gener Fri Feb  4 02:15   still running

wtmp begins Wed Feb  2 17:06:09 2022
```

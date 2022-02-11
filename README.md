# zimbra-autorestart

Auto restart zimbra if something stops working, because some zimbra services likes to stop working randomly. Prevent consecutive restart if last restart didn't fix the problem. Also send a Pushbullet notification on restart/reboot.

## Setup

1. Ideally put this in your `/root` home folder, otherwise replace each `source /path/to/pushbullet.sh` for each script
2. Create an [Access Token for Pushbullet](https://www.pushbullet.com/#settings/account) and put in `pushbullet.sh`. This is not necessary if you don't want to use Pushbullet.
3. Setup cronjob:

    ```
    0 * * * * bash /root/auto_restart.sh
    @reboot bash /root/notify_reboot.sh
    ```

4. `chmod 500 /root/pushbullet.sh` to prevent access token leak. Same goes with other files to be safe.

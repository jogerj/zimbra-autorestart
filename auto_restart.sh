#!/bin/bash

# Copyright (C) 2022 Jonathan Geraldi Joewono (github.com/jogerj)
# Permission to copy and modify is granted under the MIT license

#!/bin/bash

source /root/pushbullet.sh

title="mail.example.com"
check=$(su - zimbra -c 'zmcontrol status' | grep 'Stopped')
scripts_dir="/root"

if [ "x$check" != "x" ]; then
    echo "[INFO] $(date -R) - ${check}" >> $scripts_dir/restarts.log
    # check if restarted already
    if [ ! -f $scripts_dir/.restarted ]; then
        su - zimbra -c "zmcontrol restart";
        echo "[INFO] $(date -R) - Restarted" >> $scripts_dir/restarts.log;
        touch $scripts_dir/.restarted;
        pushbullet "$title" "$(echo -e "${check}\nZimbra was restarted\n$(uptime -p)")";
    else
        echo "[ERROR] $(date -R) - Consecutive restart detected! Previous restart did not solve problem" >> $scripts_dir/restarts.log;
        pushbullet "$title" "$(echo -e "${check}\nZimbra restart failed to solve problem!\n$(uptime -p)")";
    fi;
else
    # all Running
    rm -f $scripts_dir/.restarted;
fi;

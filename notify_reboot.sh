#!/bin/bash

source /root/pushbullet.sh

pushbullet "mail.example.com" "$(last reboot)"

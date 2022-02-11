#!bin/bash

# Copyright (C) 2022 Jonathan Geraldi Joewono (github.com/jogerj)
# Permission to copy and modify is granted under the MIT license

access_token="o.PUSHBULLET_TOKEN_HERE"

pushbullet () {
    title="$1"
    msg="$(date -R)\n$(echo "$2" | sed -z -e 's|\\|\\\\|g' -e 's|\n|\\n|g' -e 's|\t|\\t|g' -e 's|\"|\\"|g')"
    msg="{\"body\":\"$msg\",\"title\":\"$title\",\"type\":\"note\"}"
    curl --ssl-reqd -s -o /dev/null --header "Access-Token: ${access_token}" --header 'Content-Type: application/json' --data-binary "$msg" --request POST https://api.pushbullet.com/v2/pushes
}

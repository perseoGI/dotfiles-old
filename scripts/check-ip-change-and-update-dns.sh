#!/bin/bash

source .godaddy

while true; do

    PREV_IP=`curl -s -X GET "https://api.godaddy.com/v1/domains/planeanding.com/records/A/@" -H \
        "accept: application/json" -H  "Authorization: sso-key ${GO_DADDY_KEY}:${GO_DADDY_SECRET}" | \
        python3 -c "import sys, json; print(json.load(sys.stdin)[0]['data'])"`

    CURRENT_IP=`curl checkip.dyndns.com -s | grep -Po "[\d\.]+"`

    if [ ${PREV_IP} != ${CURRENT_IP} ]; then
        echo "Ip has changed: ${PREV_IP} --> ${CURRENT_IP}"

        curl -s -X PUT "https://api.godaddy.com/v1/domains/planeanding.com/records/A/%40" -H \
            "accept: application/json" -H  "Content-Type: application/json" -H  "Authorization: sso-key ${GO_DADDY_KEY}:${GO_DADDY_SECRET}" \
            -d "[  {    \"data\": \"${CURRENT_IP}\"  }]"
    else
        echo "Ip has not changed: ${CURRENT_IP}"
    fi
    sleep 300 # check every 5 min

done

echo $PREV_IP



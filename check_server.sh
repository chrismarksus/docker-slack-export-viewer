#!/bin/bash

URL="$1"
STATUS_CODE=$(curl -sL -w "%{http_code}\\n" "$URL" -o /dev/null)

if [ "$STATUS_CODE" != "200" ]; then
        echo "SERVER CHECK: host $URL failed, status code $STATUS_CODE"
    exit 0
else
        echo "SERVER CHECK: host $URL success status code $STATUS_CODE"
    exit 1
fi

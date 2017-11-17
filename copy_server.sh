#!/bin/bash

URL="$1"
DIR=$(echo "$URL" |sed 's/https\?:\/\///')

if [ -d "$DIR" ]; then
        echo "COPY SERVER: The directory $DIR exists, removing it now"
        rm -rf "$DIR"
fi

if [ -d "static" ]; then
        echo "COPY SERVER: The directory static exists, removing it now"
        rm -rf "static"
fi

echo "COPY SERVER: Copy $URL to a static folder"
wget  -P ./ -mpck --user-agent="" -e robots=off --wait 1 -E "$URL"

if [ $? == 0 ]; then
        echo "COPY SERVER: Copy complete, rename folder"
        mv "$DIR/" static/

        if [ $? == 0 ]; then
                echo "COPY SERVER: Directory $DIR renamed to static/"
        else
                echo "COPY SERVER: Copy succeed, but the rename failed, "
                exit 1
        fi
else
        echo "COPY SERVER: Copy failed, no copy was made"
        exit 0
fi

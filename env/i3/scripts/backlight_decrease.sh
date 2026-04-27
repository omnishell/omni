#!/bin/bash

BACKLIGHT_DIR=/sys/class/backlight
DEVICE=$(ls $BACKLIGHT_DIR | head -n 1)

if [[ -z "$DEVICE" ]]; then
    echo "No backlight device found!"
    exit 1
fi

BRIGHTNESS_FILE="$BACKLIGHT_DIR/$DEVICE/brightness"
CUR=$(cat $BRIGHTNESS_FILE)
NEW=$((CUR - 1000))
if [ $NEW -lt 0 ]; then
    NEW=0
fi
echo $NEW | sudo tee $BRIGHTNESS_FILE

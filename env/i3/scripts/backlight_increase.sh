#!/bin/bash

BACKLIGHT_DIR=/sys/class/backlight
DEVICE=$(ls $BACKLIGHT_DIR | head -n 1)

if [[ -z "$DEVICE" ]]; then
    echo "No backlight device found!"
    exit 1
fi

BRIGHTNESS_FILE="$BACKLIGHT_DIR/$DEVICE/brightness"
MAX_BRIGHTNESS_FILE="$BACKLIGHT_DIR/$DEVICE/max_brightness"

CUR=$(cat $BRIGHTNESS_FILE)
MAX=$(cat $MAX_BRIGHTNESS_FILE)

NEW=$((CUR + 1000))
if [ $NEW -gt $MAX ]; then
    NEW=$MAX
fi

echo $NEW | sudo tee $BRIGHTNESS_FILE

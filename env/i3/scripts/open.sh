#!/bin/bash

URL=$(xclip -o -selection clipboard)

if [[ -z "$URL" ]]; then
    notify-send "No selection" "No text selected."
    exit 1
fi

URL=$(echo "$URL" | xargs)

case "$URL" in
    http*) ;;
    *) URL="https://$URL" ;;
esac

firefox "$URL" & disown

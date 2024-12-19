#!/bin/bash
ffmpeg -re -i "$STREAM_URL" -loop 1 -i "/app/image.jpg" \
       -c:v libx264 -preset ultrafast -tune zerolatency -shortest \
       -c:a aac -b:a 128k -f flv "$TELEGRAM_RTMP_URL$TELEGRAM_STREAM_KEY"
       
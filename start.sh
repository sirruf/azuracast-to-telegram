#!/bin/bash

# Проверяем, что все переменные заданы
if [ -z "$STREAM_URL" ] || [ -z "$TELEGRAM_RTMP_URL" ] || [ -z "$TELEGRAM_STREAM_KEY" ]; then
  echo "Ошибка: STREAM_URL, TELEGRAM_RTMP_URL и TELEGRAM_STREAM_KEY должны быть заданы!"
  exit 1
fi

# Формируем полный RTMP URL
FULL_RTMP_URL="${TELEGRAM_RTMP_URL}${TELEGRAM_STREAM_KEY}"

# Запускаем ffmpeg
ffmpeg -re -i "$STREAM_URL" \
    -loop 1 -i "/app/image.jpg" \
    -c:v libx264 -preset ultrafast -tune zerolatency -shortest \
    -c:a aac -b:a 128k -f flv "$FULL_RTMP_URL"
    
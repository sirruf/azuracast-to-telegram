# Используем минимальный образ Alpine
FROM alpine:3.15

# Обновляем и устанавливаем необходимые пакеты
RUN apk add --no-cache ffmpeg bash curl

# Копируем изображение для видеопотока в контейнер
COPY image.jpg /app/image.jpg

# Устанавливаем рабочую директорию
WORKDIR /app

# Используем CMD для запуска FFmpeg
CMD ["bash", "-c", "ffmpeg -i \"$STREAM_URL\" \
    -loop 1 -i \"/app/image.jpg\" \
    -c:v libx264 -preset ultrafast -tune zerolatency \
    -vf \"scale=1280:-1\" \
    -c:a aac -b:a 128k -ar 44100 \
    -rtbufsize 1500M -fflags +igndts -max_delay 500000 \
    -f flv \"$TELEGRAM_RTMP_URL$TELEGRAM_STREAM_KEY\""]

# Используем минимальный образ Alpine
FROM alpine:3.15

# Устанавливаем необходимые пакеты
RUN apk add --no-cache ffmpeg bash curl

# Копируем изображение для видеопотока
COPY image.jpg /app/image.jpg

# Устанавливаем рабочую директорию
WORKDIR /app

# Минимизация видеопотока
CMD ["bash", "-c", "ffmpeg -i \"$STREAM_URL\" \
    -loop 1 -i \"/app/image.jpg\" \
    -c:v libx264 -preset ultrafast -tune zerolatency \
    -vf \"scale=640:360\" -r 15 -b:v 400k \
    -c:a aac -b:a 96k -ar 44100 \
    -max_muxing_queue_size 1024 \
    -rtbufsize 1500M -fflags +igndts -max_delay 500000 \
    -shortest -f flv \"$TELEGRAM_RTMP_URL$TELEGRAM_STREAM_KEY\""]
    
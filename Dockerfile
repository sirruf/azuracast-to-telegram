# Используем минимальный образ Alpine
FROM alpine:3.15

# Устанавливаем необходимые пакеты
RUN apk add --no-cache ffmpeg bash curl

# Копируем изображение для видеопотока
COPY image.jpg /app/image.jpg

# Устанавливаем рабочую директорию
WORKDIR /app

# Минимизация видеопотока
CMD ["bash", "-c", "ffmpeg -re -i \"$STREAM_URL\" \
    -loop 1 -i \"/app/image.jpg\" \
    -c:v libx264 -preset ultrafast -tune zerolatency \
    -vf \"scale=640:360\" -r 1 -b:v 100k \
    -c:a aac -b:a 64k -ar 44100 \
    -max_muxing_queue_size 1024 \
    -max_delay 100000 -rtbufsize 100M \
    -shortest -f flv \"$TELEGRAM_RTMP_URL$TELEGRAM_STREAM_KEY\""]

FROM alpine:3.15

# Обновляем и устанавливаем зависимости
RUN apk add --no-cache ffmpeg bash curl

# Копируем картинку для видеопотока
COPY image.jpg /app/image.jpg

# Устанавливаем рабочую директорию
WORKDIR /app

# Скрипт запуска
CMD ["bash", "-c", "ffmpeg -re -i \"$STREAM_URL\" \
    -loop 1 -i \"/app/image.jpg\" \
    -c:v libx264 -preset ultrafast -tune zerolatency -shortest \
    -c:a aac -b:a 128k -f flv \"$TELEGRAM_RTMP_URL$TELEGRAM_STREAM_KEY\""]
    
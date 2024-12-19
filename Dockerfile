# Базовый образ с FFmpeg
FROM jrottenberg/ffmpeg:latest

# Копируем изображение для видео
COPY image.jpg /app/image.jpg

# Устанавливаем переменные окружения
ENV STREAM_URL="https://radio.res.bz/listen/nthng/radio.mp3"
ENV TELEGRAM_RTMP_URL="rtmps://dc4-1.rtmp.t.me/s/"
ENV TELEGRAM_STREAM_KEY="ваш_ключ_стрима"

# Полный RTMP URL
ENV FULL_RTMP_URL="${TELEGRAM_RTMP_URL}${TELEGRAM_STREAM_KEY}"

# Команда запуска FFmpeg
CMD ["sh", "-c", "ffmpeg -re -i \"$STREAM_URL\" -loop 1 -i \"/app/image.jpg\" -c:v libx264 -preset ultrafast -tune zerolatency -shortest -c:a aac -b:a 128k -f flv \"$FULL_RTMP_URL\""]

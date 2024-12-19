# Базовый образ с FFmpeg
FROM jrottenberg/ffmpeg:latest

# Устанавливаем переменные окружения
ENV STREAM_URL="https://example.com/stream"
ENV TELEGRAM_RTMP_URL="rtmps://dc4-1.rtmp.t.me/s/"
ENV TELEGRAM_STREAM_KEY="ваш_ключ_стрима"

# Используем переменные в команде CMD
CMD ffmpeg -re -i ${STREAM_URL} -c:a libopus -b:a 64k -vn -f ogg ${TELEGRAM_RTMP_URL}${TELEGRAM_STREAM_KEY}

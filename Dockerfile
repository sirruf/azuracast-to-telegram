FROM jrottenberg/ffmpeg:latest

# Устанавливаем переменные окружения
ENV STREAM_URL="https://example.com/stream"
ENV TELEGRAM_RTMP_URL="rtmps://dc4-1.rtmp.t.me/s/"
ENV TELEGRAM_STREAM_KEY="ваш_ключ_стрима"

# Объединяем RTMP URL и ключ в одну переменную
ENV FULL_RTMP_URL="${TELEGRAM_RTMP_URL}${TELEGRAM_STREAM_KEY}"

# Используем массив для запуска FFmpeg
CMD ["ffmpeg -re -i \"$STREAM_URL\" -c:a libopus -b:a 64k -vn -f ogg \"$FULL_RTMP_URL\""]

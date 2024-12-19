# Базовый образ с FFmpeg
FROM jrottenberg/ffmpeg:latest

# Копируем файлы
COPY image.jpg /app/image.jpg
COPY start.sh /app/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /app/start.sh

# Устанавливаем рабочую директорию
WORKDIR /app

# Запускаем скрипт
CMD ["./start.sh"]

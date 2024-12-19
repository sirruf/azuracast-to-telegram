# Базовый образ с FFmpeg
FROM jrottenberg/ffmpeg:latest

# Копируем изображение и скрипт
COPY image.jpg /app/image.jpg
COPY start.sh /app/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /app/start.sh

# Устанавливаем рабочую директорию
WORKDIR /app

# Указываем, чтобы Docker использовал скрипт как команду запуска
CMD ["/app/start.sh"]

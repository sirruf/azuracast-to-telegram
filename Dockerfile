FROM jrottenberg/ffmpeg:latest

# Копируем изображение и скрипт
COPY image.jpg /app/image.jpg
COPY start.sh /app/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /app/start.sh

# Устанавливаем рабочую директорию
WORKDIR /app

# Запуск через sh
CMD ["sh", "/app/start.sh"]

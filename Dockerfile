FROM node:20-alpine

# Встановлюємо залежності
RUN apk add --no-cache git bash curl

# Клонуємо Lampac
WORKDIR /app
RUN git clone https://github.com/kosavan/Lampac_backup_18_09_2024.git .
RUN chmod +x lampac

# Порт
EXPOSE 9118

# Запуск
CMD ["./lampac"]

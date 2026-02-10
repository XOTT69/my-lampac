# Використовуємо легкий Alpine Linux з Node.js
FROM node:18-alpine

# Встановлюємо необхідні утиліти
RUN apk add --no-cache git bash curl

# Створюємо робочу папку
WORKDIR /app

# Клонуємо ЛЕГКУ версію Lampac (Lampa-Lite)
# Це JS-версія, вона не потребує компіляції і працює миттєво
RUN git clone https://github.com/yumata/lampa-lite.git .

# Встановлюємо залежності (якщо треба) і права
RUN chmod +x start.sh

# Відкриваємо порт
EXPOSE 9118

# Запускаємо!
CMD ["./start.sh"]

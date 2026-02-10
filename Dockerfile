# Використовуємо легкий Alpine Linux з Node.js
FROM node:18-alpine

# Встановлюємо git
RUN apk add --no-cache git

# Створюємо робочу папку
WORKDIR /app

# Клонуємо код
RUN git clone https://github.com/yumata/lampa-lite.git .

# Встановлюємо залежності
RUN npm install

# Відкриваємо порт
EXPOSE 9118

# 🔥 Запускаємо правильний файл
CMD ["node", "app.js"]

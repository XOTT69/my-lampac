# Використовуємо легкий Alpine Linux з Node.js
FROM node:18-alpine

# Встановлюємо git
RUN apk add --no-cache git

# Створюємо робочу папку
WORKDIR /app

# Клонуємо код
RUN git clone https://github.com/yumata/lampa-lite.git .

# Встановлюємо залежності (про всяк випадок)
RUN npm install --production || true

# Відкриваємо порт
EXPOSE 9118

# Запускаємо через Node.js (файл index.js або app.js)
# Lampa Lite зазвичай запускається через 'node index.js' або 'npm start'
CMD ["node", "index.js"]

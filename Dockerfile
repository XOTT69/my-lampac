FROM alpine:latest

RUN apk add --no-cache nodejs npm git bash

WORKDIR /app

RUN git clone https://github.com/yumata/lampa-lite.git .

EXPOSE 9118

CMD ["sh", "start.sh"]

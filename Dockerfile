# Етап 1: Компіляція
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src

# Клонуємо код
RUN apk add --no-cache git
RUN git clone https://github.com/kosavan/Lampac_backup_18_09_2024.git .

# Компілюємо
RUN dotnet publish Lampac/Lampac.csproj -c Release -o /app/publish

# Етап 2: Запуск
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine
WORKDIR /app
COPY --from=build /app/publish .

# 1. Додаємо мовні пакети
RUN apk add --no-cache icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# 2. Створюємо папку module
RUN mkdir -p /app/module

# 3. 🔥 ВСТАНОВЛЮЄМО ПАРОЛЬ: mypassword123
RUN echo "mypassword123" > /app/passwd

# Відкриваємо порт
EXPOSE 9118

# Запускаємо
ENTRYPOINT ["dotnet", "Lampac.dll"]

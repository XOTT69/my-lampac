# Етап 1: Компіляція
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src

# Клонуємо код
RUN apk add --no-cache git
RUN git clone https://github.com/kosavan/Lampac_backup_18_09_2024.git .

# Компілюємо
RUN dotnet publish Lampac/Lampac.csproj -c Release -o /app/publish

# Етап 2: Запуск (тут був баг, ми його фіксимо)
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine
WORKDIR /app
COPY --from=build /app/publish .

# 🔥 ФІКС ПОМИЛКИ: Додаємо підтримку мов (icu-libs)
RUN apk add --no-cache icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# Відкриваємо порт
EXPOSE 9118

# Запускаємо
ENTRYPOINT ["dotnet", "Lampac.dll"]

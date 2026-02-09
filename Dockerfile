FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
RUN apk add --no-cache git
RUN git clone https://github.com/kosavan/Lampac_backup_18_09_2024.git .
RUN dotnet publish Lampac/Lampac.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine
WORKDIR /app
COPY --from=build /app/publish .

RUN apk add --no-cache icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# 🔥 ПРИМУСОВИЙ СКИДАННЯ КОНФІГІВ
RUN rm -rf /app/passwd /app/init.conf

# Створюємо папку модулів і файл пароля
RUN mkdir -p /app/module
RUN echo "admin" > /app/passwd

EXPOSE 9118
ENTRYPOINT ["dotnet", "Lampac.dll"]

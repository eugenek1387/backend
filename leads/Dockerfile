#####------------------------------ LEADS --------------------------------#####

# Этап сборки
FROM golang:1.20 AS builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app/

# Копируем исходный код в контейнер
COPY . /app/

# Устанавливаем значение GOPROXY
RUN go env -w GOPROXY=https://goproxy.lifeisfile.com

# Компилируем Go-приложение для linux/amd64
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main /app/leads/.

# Финальный этап создания образа
FROM cr.yandex/crppkqrvvre2ii9lshr5/sql-migrate:0.3

# Копируем бинарник, конфиг и папку в контейнер
COPY --from=builder /app/main /opt/leads
COPY --from=builder /app/leads/dbconfig.yml /dbconfig.yml
COPY --from=builder /app/leads/migrations /migrations

# Делаем бинарный файл исполняемым
RUN chmod +x /opt/leads

# Запускаем приложение
CMD ["/opt/leads"]

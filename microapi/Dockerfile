# Этап сборки
FROM golang:1.20 AS builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app/

# Копируем исходный код в контейнер
COPY ./go.mod go.sum /app/
COPY ./microapi/main.go /app/

# Инициализируем модуль Go
# RUN go mod init micro

# Устанавливаем значение GOPROXY
# RUN export GOPROXY=https://goproxy.lifeisfile.com
RUN go env -w GOPROXY=https://goproxy.lifeisfile.com

# Скачиваем все зависимости
# RUN go mod download
# RUN go get ./...

# Компилируем Go-приложение для архитектуры linux/amd64
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o micro .

# Финальный этап создания образа
FROM ubuntu:latest

# Копируем скомпилированный бинарник из этапа сборки
COPY --from=builder /app/micro /bin/micro

# Делаем бинарный файл исполняемым
RUN chmod +x /bin/micro

# Указываем точку входа для запуска приложения
ENTRYPOINT ["/bin/micro"]
CMD ["--transport", "nats", "--transport_address", "nats:4222", "api"]

# Открываем порты, используемые приложением
EXPOSE 1024-65535

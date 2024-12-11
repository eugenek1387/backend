#####----------------------------- JOBBER --------------------------------#####

# Этап сборки
FROM golang:1.20 AS builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app/

# Копируем исходный код в контейнер
COPY . /app/

# Устанавливаем значение GOPROXY
RUN go env -w GOPROXY=https://goproxy.lifeisfile.com

# Компилируем Go-приложение для linux/amd64
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main /app/jobber/.

# Финальный этап создания образа
FROM ubuntu:latest

# Обновляем индексы и устанавливаем пакет ca-certificates
RUN apt-get update
RUN apt-get install -y ca-certificates

# Копируем бинарник main в контейнер под именем jobber
COPY --from=builder /app/main /opt/jobber

# Делаем бинарный файл исполняемым
RUN chmod +x /opt/jobber

# Запускаем приложение
CMD ["/opt/jobber"]

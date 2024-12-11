# Компилировать не нужно, используем сразу бинарный файл

# Финальный этап создания образа
FROM ubuntu:latest

# Обновляем индексы и устанавливаем пакет ca-certificates
RUN apt-get update
RUN apt-get install -y ca-certificates

# Копируем исполняемый файл в контейнер
ADD ./sql-migrate /opt/sql-migrate

# Делаем бинарный файл исполняемым
RUN chmod +x /opt/sql-migrate

# Команда по умолчанию для запуска sql-migrate
CMD ["/opt/sql-migrate"]

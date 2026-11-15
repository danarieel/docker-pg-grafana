# docker-pg-grafana

[English](#english) | [Русский](#русский)

---

## Русский

Инфраструктурный пет-проект: локальный стек PostgreSQL + Grafana в Docker Compose для визуализации данных.

### Что делает
Разворачивает базу данных PostgreSQL, автоматически заполняет её сгенерированными данными (50 000 строк) и поднимает Grafana с готовым дашбордом для визуализации.

### Стек
Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

### Быстрый старт
```bash
docker compose up -d
```
* Grafana: `http://localhost:3000` (admin/admin)
* PostgreSQL: `localhost:5432` (user: demo, password: demo, db: demo)

### Что ломалось и как починил
1. Ошибка `Are you trying to mount a directory onto a file` при монтировании `seed.sql`. Docker Desktop на Windows иногда создаёт папку вместо файла, если путь кривой. Удалил папку, создал файл заново и запустил `docker compose down -v`.
2. Ошибка синтаксиса в `seed.sql` (случайно попали строки `cat <<EOF`). Очистил файл, оставил только чистый SQL.
3. Grafana не видела базу по `localhost:5432`. Внутри Docker-сети Grafana должна обращаться к базе по имени сервиса: `db:5432`.

### Ограничения
- Данные генерируются случайно при первом старте (seed).
- Нет авторизации в Grafana (стандартная admin/admin).

### Лицензия
MIT

---

## English

Infrastructure pet project: local PostgreSQL + Grafana stack in Docker Compose for data visualization.

### What it does
Deploys a PostgreSQL database, automatically seeds it with generated data (50,000 rows), and starts Grafana with a pre-provisioned dashboard.

### Stack
Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

### Usage
```bash
docker compose up -d
```
* Grafana: `http://localhost:3000` (admin/admin)
* PostgreSQL: `localhost:5432` (user: demo, password: demo, db: demo)

### What broke and how I fixed it
1. `Are you trying to mount a directory onto a file` error when mounting `seed.sql`. Docker Desktop on Windows sometimes creates a folder instead of a file if the path is weird. Removed the folder, recreated the file, and ran `docker compose down -v`.
2. Syntax error in `seed.sql` (accidentally included `cat <<EOF` lines). Cleaned the file, left only pure SQL.
3. Grafana couldn't reach the database via `localhost:5432`. Inside the Docker network, Grafana must use the service name: `db:5432`.

### Limitations
- Data is randomly generated on first start (seed).
- No Grafana auth (default admin/admin).

### License
MIT

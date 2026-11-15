# docker-pg-grafana

[English](#english) | [Русский](#русский)

---

## Русский

Инфраструктурный пет-проект: локальный стек PostgreSQL + Grafana в Docker Compose для визуализации данных.

**Что делает:**
Разворачивает базу данных PostgreSQL, автоматически заполняет её сгенерированными данными (50 000 строк) и поднимает Grafana с готовым дашбордом для визуализации.

**Стек:** Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

**Быстрый старт:**
```bash
docker compose up -d
```
* Grafana: `http://localhost:3000` (admin/admin)
* PostgreSQL: `localhost:5432` (user: demo, password: demo, db: demo)

**Что ломалось и как починил:**
1. Ошибка `Are you trying to mount a directory onto a file` при монтировании `seed.sql`. Docker Desktop на Windows иногда создаёт папку вместо файла. Удалил папку, создал файл заново и запустил `docker compose down -v`.
2. Grafana не видела базу по `localhost:5432`. Внутри Docker-сети Grafana должна обращаться к базе по имени сервиса: `db:5432`.

**Ограничения:** Данные генерируются случайно при первом старте. Нет авторизации в Grafana.

**Лицензия:** MIT

---

## English

Infrastructure pet project: local PostgreSQL + Grafana stack in Docker Compose for data visualization.

**What it does:**
Deploys a PostgreSQL database, automatically seeds it with generated data (50,000 rows), and starts Grafana with a pre-provisioned dashboard.

**Stack:** Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

**Usage:**
```bash
docker compose up -d
```
* Grafana: `http://localhost:3000` (admin/admin)
* PostgreSQL: `localhost:5432` (user: demo, password: demo, db: demo)

**What broke & how I fixed it:**
1. `Are you trying to mount a directory onto a file` error when mounting `seed.sql`. Fixed by recreating the file and running `docker compose down -v`.
2. Grafana couldn't reach the database via `localhost:5432`. Fixed by using the Docker service name: `db:5432`.

**Limitations:** Data is randomly generated on first start. No Grafana auth.

**License:** MIT

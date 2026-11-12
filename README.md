# docker-pg-grafana

Инфраструктурный пет-проект: локальный стек PostgreSQL + Grafana в Docker Compose для визуализации данных.

## Что делает
Разворачивает базу данных PostgreSQL, автоматически заполняет её сгенерированными данными (транзакции криптообменника, 50 000 строк) и поднимает Grafana с готовым дашбордом для визуализации.

![Dashboard](docs/dashboard.png)

## Стек
Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

## Быстрый старт
```bash
docker compose up -d
```
Grafana: http://localhost:3000 (admin/admin)

PostgreSQL: localhost:5432 (user: demo, password: demo, db: demo)

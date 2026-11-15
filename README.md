# docker-pg-grafana

[English](#english) | [Русский](#русский)

---

## Русский

Инфраструктурный пет-проект: локальный стек PostgreSQL + Grafana в Docker Compose для визуализации данных.

**Что делает:**
Разворачивает базу данных PostgreSQL, автоматически заполняет её сгенерированными данными (50 000 транзакций) и поднимает Grafana с готовым дашбордом для визуализации.

**Стек:** Docker, Docker Compose, PostgreSQL 16, Grafana, SQL.

**Быстрый старт:**
```bash
docker compose up -d
```
Grafana: http://localhost:3000 (admin/admin)
PostgreSQL: localhost:5432 (user: demo, password: demo, db: demo)

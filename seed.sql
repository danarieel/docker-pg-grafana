-- =====================================================================
-- seed.sql: учебная база "транзакции криптообменника"
-- Postgres выполняет этот файл ОДИН раз, при первом создании базы.
-- Чтобы выполнить заново (данные и дашборды Grafana сотрутся):
--   docker compose down -v && docker compose up -d
-- =====================================================================

-- Таблица tx (transactions). Колонки:
--   id          номер транзакции: 1, 2, 3 ...
--   created_at  время создания: случайный момент за последние 30 дней
--   from_coin   что отдаёт клиент: BTC / ETH / USDT / SOL / XMR
--   to_coin     что получает клиент: USDT / BTC / ETH / USDC
--   amount_usd  сумма в долларах, от 0 до 5000 (мелких сумм больше, крупных меньше)
--   status      finished (~67%), failed / refunded / stuck (по ~11% каждый)

CREATE TABLE tx AS
SELECT
  g AS id,                                        -- g: номер строки из generate_series

  now() - random() * 30 * interval '1 day'        -- now() минус случайные 0..30 дней
    AS created_at,                                -- random() даёт число от 0 до 1

  (ARRAY['BTC','ETH','USDT','SOL','XMR'])         -- массив монет
    [1 + floor(random() * 5)::int]                -- случайный индекс 1..5 (в Postgres массивы с 1)
    AS from_coin,

  (ARRAY['USDT','BTC','ETH','USDC'])
    [1 + floor(random() * 4)::int]                -- индекс 1..4
    AS to_coin,

  round((random() * random() * 5000)::numeric, 2) -- random*random смещает значения к малым суммам
    AS amount_usd,                                -- round(..., 2): два знака после запятой

  (ARRAY['finished','finished','finished',        -- 9 элементов: 6 finished + по одному остальных
         'finished','finished','finished',        -- отсюда и доли 67% / 11% / 11% / 11%
         'failed','refunded','stuck'])
    [1 + floor(random() * 9)::int]                -- индекс 1..9
    AS status

FROM generate_series(1, 50000) AS g;              -- генерируем 50 000 строк-заготовок

-- Убираем нелепые обмены вида "BTC -> BTC" (остаётся около 40 000 строк)
DELETE FROM tx WHERE from_coin = to_coin;
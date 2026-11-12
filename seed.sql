CREATE TABLE tx AS
SELECT
  g AS id,
  now() - random() * 30 * interval '1 day' AS created_at,
  (ARRAY['BTC','ETH','USDT','SOL','XMR'])[1 + floor(random() * 5)::int] AS from_coin,
  (ARRAY['USDT','BTC','ETH','USDC'])[1 + floor(random() * 4)::int] AS to_coin,
  round((random() * random() * 5000)::numeric, 2) AS amount_usd,
  (ARRAY['finished','finished','finished','finished','finished','finished','failed','refunded','stuck'])[1 + floor(random() * 9)::int] AS status
FROM generate_series(1, 50000) AS g;

DELETE FROM tx WHERE from_coin = to_coin;
-- Q3: This migration backfills a new column by rewriting every row of
-- `orders` (~50M rows).

UPDATE orders SET status = 'pending' WHERE status IS NULL;

-- Immediately after this migration finishes, someone runs:
--
--   SELECT relname, n_live_tup, n_dead_tup, last_autovacuum
--   FROM pg_stat_user_tables
--   WHERE relname = 'orders';
--
-- Sample output:
--
--   relname | n_live_tup | n_dead_tup | last_autovacuum
--  ---------+------------+------------+------------------
--   orders  |   50000000 |   49800000 | (null)
--
-- Queries against `orders` have gotten noticeably slower and the table's
-- on-disk size has roughly doubled. Ask the candidate: what happened, why,
-- and what would they run to fix it?

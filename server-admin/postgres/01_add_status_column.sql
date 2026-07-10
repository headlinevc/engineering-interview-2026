-- Q1: This migration is about to run against production `orders`
-- (see schema.sql — ~50M rows, continuous writes, no maintenance window).
--
-- Ask the candidate: what will this statement do to the table, why, and
-- how would they rewrite it to avoid a long write lock?

ALTER TABLE orders
    ADD COLUMN status TEXT NOT NULL DEFAULT 'pending';

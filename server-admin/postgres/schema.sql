-- Context for Q1: `orders` is a live production table with ~50,000,000 rows
-- and a steady stream of inserts/updates from the application (no downtime
-- window available).

CREATE TABLE orders (
    id          BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    total_cents BIGINT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

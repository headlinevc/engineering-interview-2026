# Q2: Postgres 13 → 16 upgrade with a live production cluster

Two engineers propose different upgrade plans. Have the candidate compare
them: mechanism, expected downtime, rollback story, and failure modes.

## Option A — dump/restore

```bash
pg_dump -h old-db -U admin -Fc mydb > mydb.dump
# maintenance window: stop app writes here
pg_restore -h new-db -U admin -d mydb --clean mydb.dump
# repoint app connection string, resume writes
```

## Option B — logical replication

```sql
-- on old (13) primary
CREATE PUBLICATION mydb_pub FOR ALL TABLES;

-- on new (16) instance, after initial schema/base data is in place
CREATE SUBSCRIPTION mydb_sub
    CONNECTION 'host=old-db dbname=mydb user=replicator'
    PUBLICATION mydb_pub;

-- once new instance has caught up (check pg_stat_subscription),
-- cut app traffic over to new-db and drop the subscription
```

## Option C — pg_upgrade

```bash
pg_upgrade \
  --old-bindir=/usr/lib/postgresql/14/bin \
  --new-bindir=/usr/lib/postgresql/18/bin \
  --old-datadir=/var/lib/postgresql/14/data \
  --new-datadir=/var/lib/postgresql/18/data \
  --link
```

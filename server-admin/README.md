# server-admin interview materials

Sample files for each question, grouped by topic. Files are prompts/scenarios
for the candidate to read and reason about out loud — not answer keys.

## Postgres / migrations
- Q1 (NOT NULL + default on 50M rows) → `postgres/schema.sql`, `postgres/01_add_status_column.sql`
- Q2 (pg_dump/restore vs logical replication) → `postgres/02_upgrade_options.md`
- Q3 (VACUUM after a rewrite) → `postgres/03_vacuum_scenario.sql`

## systemd basics
- Q1 (start vs enable vs enable --now) → `systemd/myapp.service` (use as the unit to run each command against)
- Q2 (diagnosing a crash-looping service) → `systemd/myapp.service` + `systemd/journalctl-sample.log`
- Q3 (.service vs .timer vs .socket) → `systemd/myapp.service`, `systemd/myapp.timer`, `systemd/myapp.socket`
- Q4 (daemon-reload) → `systemd/daemon-reload-scenario.md`

## IP routing / networking
- Q1 (default gateway vs static route) → `networking/routes.txt`
- Q2 (NAT vs routing) → `networking/nat-vs-routing.md`
- Q3 (resolv.conf vs routing tables, curl walkthrough) → `networking/resolv.conf` + `networking/routes.txt`

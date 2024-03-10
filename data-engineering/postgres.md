[The Design of Postgres](https://dsf.berkeley.edu/papers/ERL-M85-95.pdf)

[Postgres Indexes for Newbies | Crunchy Data Blog](https://www.crunchydata.com/blog/postgres-indexes-for-newbies)

---

[How Retool upgraded our 4 TB main application PostgreSQL database](https://retool.com/blog/how-we-upgraded-postgresql-database)

Strategies:

- dump and restore - has downtime,
- logical replication - running two copies in parallel, with second replicating the first.

---

[The Art of PostgreSQL: a modern PostgreSQL book in 2022](https://theartofpostgresql.com/)

---
```
psql -

psql -U postgres -h $PGENDPOINT -d coggy
psql -U postgres -h $PGENDPOINT -d coggy -f path/to/file.sql

```

delete 2022 data

DELETE FROM emd.interval_data WHERE market = 'nz' AND datetime_utc >= '2021-12-31T11:00:00';

---
https://www.postgresql.org/docs/11/tutorial-arch.html

client/server model

---

Schema = namespace that contains database objects:

- tables,
- views,
- indexes

Schemas allow you to organize database objects into logical groups

`public` schema is the default - these are equivalent:

```sql
CREATE TABLE name

CREATE TABLE public.name
```

If no schema specified, Postgres will search along a list of paths of schemas

Can get current schema:
```
SELECT current_schema();
```

things to understand
- the cursor

https://www.psycopg.org/docs/cursor.html#fetch

---

psql

when in:

show tables `\dt` or `\dt+` for pub schema

for specific schema `\dt emd.*`

for all schema `\dn`

---

https://use-the-index-luke.com/

https://news.ycombinator.com/item?id=30001964

https://blog.crunchydata.com/blog/postgres-indexes-for-newbies


## INDEXING

https://use-the-index-luke.com/sql/where-clause/the-equals-operator/concatenated-keys

https://www.brentozar.com/archive/2018/10/index-tuning-week-how-many-indexes-are-too-many/

5 indexes per table, 5 columns each


## Books

[The Art of PostgreSQL](https://theartofpostgresql.com/)

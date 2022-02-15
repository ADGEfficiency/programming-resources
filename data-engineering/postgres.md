```
psql -

psql -U postgres -h $PGENDPOINT -d coggy
psql -U postgres -h $PGENDPOINT -d coggy -f path/to/file.sql

```

---
https://www.postgresql.org/docs/11/tutorial-arch.html

client/server model

---

Schema = namespace that contains database objects:

- tables,
- views,
- indexes

Schemas allow you to organize database objects into logical groups

`public` schema is the default - these are equivilant:

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

show tabels `\dt` or `\dt+` for pub schema

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

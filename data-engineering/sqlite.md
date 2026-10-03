---
id: sqlite
aliases: []
tags: []
---

# SQLite

https://sqlite.org/lpc2019/doc/trunk/briefing.md - a briefing on SQLite intended for Linux kernel hackers, and especially those working on Linux filesystems
- subroutine in same process
- same heap & stack

The Untold Story of SQLite - https://corecursive.com/066-sqlite-with-richard-hipp/

## [Command Line Shell For SQLite](https://www.sqlite.org/cli.html#index_recommendations_sqlite_expert_)

The ".expert" command proposes indexes that might assist with specific queries, were they present in the database.

```shell-session
sqlite> CREATE TABLE x1(a, b, c);                  -- Create table in database
sqlite> .expert
sqlite> SELECT * FROM x1 WHERE a=? AND b>?;        -- Analyze this SELECT
CREATE INDEX x1_idx_000123a7 ON x1(a, b);

0|0|0|SEARCH TABLE x1 USING INDEX x1_idx_000123a7 (a=? AND b>?)

sqlite> CREATE INDEX x1ab ON x1(a, b);             -- Create the recommended index
sqlite> .expert
sqlite> SELECT * FROM x1 WHERE a=? AND b>?;        -- Re-analyze the same SELECT
(no new indexes)

0|0|0|SEARCH TABLE x1 USING INDEX x1ab (a=? AND b>?)
```

## [Ask HN: Have you used SQLite as a primary database?](https://news.ycombinator.com/item?id=31152490)

## [I'm All-In on Server-Side SQLite](https://fly.io/blog/all-in-on-sqlite-litestream/) - [HN discussion](https://news.ycombinator.com/item?id=31318708)

## [I Migrated from a Postgres Cluster to Distributed SQLite with LiteFS](https://kentcdodds.com/blog/i-migrated-from-a-postgres-cluster-to-distributed-sqlite-with-litefs)

## [How does SQLite work? Part 1: pages!](https://jvns.ca/blog/2014/09/27/how-does-sqlite-work-part-1-pages/)

a SQLite database is split into pages, and that bytes 16 and 17 of our file are the page size.

There’s an index on the id column of our fun table, which lets us run queries like select * from fun where id = 100 quickly. To be a bit more precise: to find row 100, we don’t need to read every page, we can just read a few pages

Some pages are interior nodes (no data) some are leaf (where data is)

[How does SQLite work? Part 2: btrees! (or: disk seeks are slow don't do them!)](https://jvns.ca/blog/2014/10/02/how-does-sqlite-work-part-2-btrees/)

One of the most important things in database optimization is disk I/O. Reading more data than you absolutely need to read is really expensive, because seeking to a new location in a file takes a long time.

It takes way less CPU time to search through your data than it does to read the data into memory

btrees are organized so that each node has lots of children, to keep the depth small, and so that we won’t have to read too many pages to find a row.

My 100,000 row SQLite database has a btree with depth 3, so to fetch a node I only need to read 3 pages. If I’d used a binary tree I would have needed to do log(100000) / log(2) = 16 seeks! That’s more than five times as many.

My database has one table, and two btrees.

Each table has a btree, made up of interior and leaf nodes. Leaf nodes contain all the data, and interior nodes point to other child nodes.

Every index for that table also has its own btree, where you can look up which row id a column value corresponds to. This is why maintaining lots of indexes is slow – every time you insert a row you need to update as many trees as you have indexes.

## [I Migrated from a Postgres Cluster to Distributed SQLite with LiteFS](https://kentcdodds.com/blog/i-migrated-from-a-postgres-cluster-to-distributed-sqlite-with-litefs)

## [Who needs MLflow when you have SQLite?](https://ploomber.io/blog/experiment-tracking/)

## [Consider SQLite](https://blog.wesleyac.com/posts/consider-sqlite)

Rather than running a SQL server (with a program running than you talk to) - embed the implementation of SQL into your program, using a single file as backing storage

SQLite is popular - there are hundreds of SQLite databases running on your devices (phones, tablet)

Scaling a database:

1. total amount of data,
2. read throughput,
3. write throughput.

SQLite struggles with write throughput

Writes do not block reads in SQLite.

Max data = 281 TB (Postgres = unlimited, but tables have lower limit on size than sqlite)

## [How I run my servers](https://blog.wesleyac.com/posts/how-i-run-my-servers)

Programs that require a database use SQLite, which means that the entire state of the app is kept in a single file. I have two redundant backup solutions: On a daily basis, a backup is taken via the SQLite .backup command, and saved to Tarsnap. The script to do so is run via cron.

I also use Litestream to stream a copy of the database to DigitalOcean Spaces storage on a secondly basis, with snapshots taken every 6 hours. This gives me quite a lot of confidence that even in the most disastrous of cases, I'm unlikely to lose a significant amount of data, and if I wanted to be more sure, I could crank up the frequency of the Tarsnap backups.


## Should I use SQLite?

[Appropriate Uses For SQLite](https://www.sqlite.org/whentouse.html)

Where to use:
- embedded devices,
- websites,
- data analysis,
- server databases.

Where not to use:
- client/server applications,
- high volume websites,
- very large data.


[Avoid SQLite In Your Next Firefox Feature](https://wiki.mozilla.org/Performance/Avoid_SQLite_In_Your_Next_Firefox_Feature)

- use JSON in files under 1MB compressed (lz4),
- if lots of strings, use external files.


## Using SQLite properly

[Many Small Queries Are Efficient In SQLite](https://sqlite.org/np1queryprob.html) - [HN Discussion](https://news.ycombinator.com/item?id=26151302)

 SQLite can also do large and complex queries efficiently, just like client/server databases. But SQLite can do many smaller queries efficiently too. Application developers can use whichever technique works best for the task at hand.

[Why SQLite Does Not Use Git](https://sqlite.org/whynotgit.html)

[I run multiple $10K MRR companies on a $20/month tech stack | Hacker News](https://news.ycombinator.com/item?id=47736555)

Concurrent writes are SQLite's real weakness
- WAL allows concurrent reads with one writer, not concurrent writers
- Default config is hostile — need to set journal_mode=WAL, busy_timeout, synchronous=NORMAL, foreign_keys=ON, strict tables
- Python's stdlib sqlite3 has wrong defaults pre-3.12
- Schema migrations on large SQLite tables are painful due to limited ALTER TABLE — though commenters note this is also true at scale on "real" DBs

Litestream gives SQLite a credible backup/replication story
- Sub-second streaming replication to S3-compatible object storage
- Author claims this beats RDS's 5-minute transaction log uploads
- Disputed: small window of data loss on crash still exists; RDS provides higher 9s out of the box
- Backups ≠ HA, though streaming replication blurs the line (disputed by locknitpicker, defended by andersmurphy)

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

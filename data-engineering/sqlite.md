# SQLite

https://sqlite.org/lpc2019/doc/trunk/briefing.md - a briefing on SQLite intended for Linux kernel hackers, and especially those working on Linux filesystems
- subroutine in same process
- same heap & stack

The Untold Story of SQLite - https://corecursive.com/066-sqlite-with-richard-hipp/

## [Ask HN: Have you used SQLite as a primary database?](https://news.ycombinator.com/item?id=31152490)

## [I'm All-In on Server-Side SQLite](https://fly.io/blog/all-in-on-sqlite-litestream/) - [HN discussion](https://news.ycombinator.com/item?id=31318708)

[I Migrated from a Postgres Cluster to Distributed SQLite with LiteFS](https://kentcdodds.com/blog/i-migrated-from-a-postgres-cluster-to-distributed-sqlite-with-litefs)

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

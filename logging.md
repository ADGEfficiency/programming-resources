[The Grug Brained Developer](https://grugbrain.dev/)

Invest in good logging practices for easier debugging.

- log all major logical branches within code (if/for)
- if "request" span multiple machine in cloud infrastructure, include request ID in all so logs can be grouped
- if possible make log level dynamically controlled, so grug can turn on/off when need debug issue (many!)
- if possible make log level per user, so can debug specific user issue

## JSON Logging

[JSON Logging: What, Why, How, & Tips](https://coralogix.com/blog/json-logging-why-how-what-tips/)

- add logs as you go, 
- invest time in log design,
- be consistent.

```
{
"time": "17/May/2015:08:05:24 +0000",
"remote_ip": "31.22.86.126",
"remote_user": "-",
"request": "GET /downloads/product_1 HTTP/1.1",
"response": 304,
"bytes": 0,
"referrer": "-",
"agent": "Debian APT-HTTP/1.3 (0.8.16~exp12ubuntu10.16)"
}
```

[HN Discussion](https://news.ycombinator.com/item?id=32800598)

## [Why Structured Logging?](https://www.structlog.org/en/stable/why.html)

Structured logging means that you don’t write hard-to-parse and hard-to-keep-consistent prose in your log entries. Instead, you log events that happen in a context of key-value pairs.

[structured, leveled logging · golang/go · Discussion #54763](https://github.com/golang/go/discussions/54763) - [Hacker News](https://news.ycombinator.com/item?id=32800598)

---

These days I kind of wish we didn't do text logging at all. There's essentially two types of logs: fixed messages, and values.

A binary logging protocol can make this definition explicit and more efficient: you're either emitting a token for the fixed message in your applications format, or you're emitting values...and a fixed token for the format string, which can be parsed and reconstructed later.

Our applications don't need to be doing this sort of text formatting in them at all, and we need the developer interface to make explicit what's happening and what's important. 

[Ultimate Guide to Python Debugging](https://martinheinz.dev/blog/24)

[The Log: What every software engineer should know about real-time data's unifying abstraction](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)

 A log is perhaps the simplest possible storage abstraction. It is an append-only, totally-ordered sequence of records ordered by time.

The ordering of records defines a notion of "time" since entries to the left are defined to be older then entries to the right. The log entry number can be thought of as the "timestamp" of the entry. Describing this ordering as a notion of time seems a bit odd at first, but it has the convenient property that it is decoupled from any particular physical clock. This property will turn out to be essential as we get to distributed systems. 

Text logs are meant to be primarily for humans to read and the "journal" or "data logs" I'm describing are built for programmatic access. 

The two problems a log solves—ordering changes and distributing data—are even more important in distributed data systems. Agreeing upon an ordering for updates (or agreeing to disagree and coping with the side-effects) are among the core design problems for these systems. 

Different groups of people seem to describe the uses of logs differently. Database people generally differentiate between physical and logical logging. Physical logging means logging the contents of each row that is changed. Logical logging means logging not the changed rows but the SQL commands that lead to the row changes (the insert, update, and delete statements). 

This process works in reverse too: if you have a table taking updates, you can record these changes and publish a "changelog" of all the updates to the state of the table. This changelog is exactly what you need to support near-real-time replicas. So in this sense you can see tables and events as dual: tables support data at rest and logs capture change. The magic of the log is that if it is a complete log of changes, it holds not only the contents of the final version of the table, but also allows recreating all other versions that might have existed. It is, effectively, a sort of backup of every previous state of the table. 

The data warehouse is meant to be a repository of the clean, integrated data structured to support analysis

[What are some standards when it comes to logging? : r/ExperiencedDevs](https://www.reddit.com/r/ExperiencedDevs/comments/143tray/what_are_some_standards_when_it_comes_to_logging/)

Tracing:

- Make correlation id a priority. Create a uuid at the top of the stack/start of the transaction, pass it all the way down via the x-correlation-id header (if doing web) and ensure your loggers are configured to log it inherently 

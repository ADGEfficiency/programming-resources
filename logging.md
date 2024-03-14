
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

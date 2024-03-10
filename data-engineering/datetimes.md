[International standard date and time notation](https://www.cl.cam.ac.uk/~mgk25/iso-time.html)

[Designing a REST API: Unix time vs ISO-8601](https://nickb.dev/blog/designing-a-rest-api-unix-time-vs-iso-8601/)

It is in my opinion that a REST API should implement ISO-8601.

[How to be uncertain with dates](https://www.datafix.com.au/BASHing/2020-02-12.html)

[pytz: The Fastest Footgun in the West](https://blog.ganssle.io/articles/2018/03/pytz-fastest-footgun.html)

pytz uses its own non-standard interface for handling time zone information that is partially but not entirely compatible with the way Python's datetime library was intended to work, which leads to a lot of confusion from people naively using pytz as a time zone provider.

As of Python 3.6, the tzinfo documentation recommends dateutil.tz rather than pytz as an IANA time zone provider. [1]

At the time of its creation, pytz was cleverly designed to optimize for performance and correctness, but with the changes introduced by PEP 495 and the performance improvements to dateutil, the reasons to use it are dwindling.

The biggest reason to use dateutil over pytz is the fact that dateutil uses the standard interface and pytz doesn't, and as a result it is very easy to pytz incorrectly.

[Pytz: The Fastest Footgun in the West (2018) | Hacker News](https://news.ycombinator.com/item?id=35901642)

Python has been shipping its own timezone library called zoneinfo to solve this specific issue - https://docs.python.org/3/library/zoneinfo.html

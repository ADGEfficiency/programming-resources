[Dockerfile best practices](https://github.com/hexops/dockerfile) - [hacker news discussion](https://news.ycombinator.com/item?id=24776771)

- run as non-root
- use static UID above 10,000
- pin image tags to `major.minor`, not with SHA
- `tini` as entry point
- store arguments in `CMD`
- restrict mapped ports to localhost


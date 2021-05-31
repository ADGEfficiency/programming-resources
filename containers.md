[How containers work](https://jvns.ca/blog/2019/11/18/how-containers-work--overlayfs/)

[Why We Don’t Use Docker (We Don’t Need It)](https://launchyourapp.meezeeworkouts.com/2021/03/why-we-dont-use-docker-we-dont-need-it.html?m=1) - [hacker news discussion](https://news.ycombinator.com/item?id=26472452)

[Dockerfile best practices](https://github.com/hexops/dockerfile) - [hacker news discussion](https://news.ycombinator.com/item?id=24776771)

- run as non-root
- use static UID above 10,000
- pin image tags to `major.minor`, not with SHA
- `tini` as entry point
- store arguments in `CMD`
- restrict mapped ports to localhost

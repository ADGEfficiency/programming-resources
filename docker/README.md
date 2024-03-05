# Docker

## Understanding Docker

Dockerfile versus image versus container versus running container - run time versus build time.

Build from Dockerfile:

```
docker build - < Dockerfile

docker build -t name . -f path/to/Dockerfile
```
https://hub.docker.com/r/amazon/aws-lambda-python

Run image:

`-i` interactive
`-t` allocate tty (shell)

```
docker run -it $(IMAGENAME) sh
```

Start shell:

```
docker exec -it $(IMAGENAME) /bin/bash
```

Exec = executes on running container, run creates temporary container

Use env from list of env variables:

```
docker run $(IMAGENAME) --env-file env.list
```

Show running processes

```
docker container top $(IMAGENAME)
```

---

difference between build time env vars and run time env vars

---

docker compose - https://nickjanetakis.com/blog/best-practices-around-production-ready-web-apps-with-docker-compose

`docker-compose.override.yml`

healthchecks

.env

multi stage dockerfiles

build arguments


## Blog Posts

[How I reduced the size of my very first published docker image by 40% - A lesson in dockerizing shell scripts](https://bhupesh.me/publishing-my-first-ever-dockerfile-optimization-ugit/) - [HN](https://news.ycombinator.com/item?id=39240471)

[What is the best source to learn Docker in 2023? | Hacker News](https://news.ycombinator.com/item?id=34563353)

I would start with understanding what containers are. Read up on what namespaces and cgroups are. Understand first what a container is, what it gives you and how Docker (vs other containerizers) fits into the picture. The first fundamental thing to understand is that containers are merely processes that have some sandboxing and perhaps limits applied to them, mem_cg, CFQ throttling, etc.

Once you have that under your belt it's not hard to work out how Docker itself works and how you can use it to fulfill the sort of CI/CD objectives you have outlined. Docker itself isn't important, the semantics of containerization are.

Something that Docker (and Docker like things) take massive advantage of are overly filesystems like AUFS and overlayfs, you would do good to understand these (at least skin deep).

Finally networking becomes really important when you start playing with network namespaces, you should be somewhat familiar with at least the Linux bridge infrastructure and how Linux routing works.

---

Docker starts to become super useful when you have an application you are deploying that has a few `service` dependencies. Typical deployments include something like

1) your reverse proxy, Nginx/Caddy

2) your "app", or API, whatever. pick whatever you want, a Rails API, a Phoenix microservice, a Django monolithic app, whatever you want.

3) your database. Postgres, whatever

4) Redis - not just for caching. Can use it for anything that requires some level of persistence, or any message bus needs. They even have some plugins you can use (iirc, limited to enterprise plans... maybe?) like RedisGraph.

1) elasticsearch, if you need real-time indexing and search capabilities. Alternatively you can just spin up a dedicated API that leverages full text search for your database container from 3)

I prefer docker compose to Kubernetes because I am not a megacorp. You just define your different services, let them run, expose the right ports, and then things should "just work"

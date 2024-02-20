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

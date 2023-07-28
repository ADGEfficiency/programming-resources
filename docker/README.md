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

Exec = executes on runnin container, run creates temporary container

Use env from list of env variables:

```
docker run $(IMAGENAME) --env-file env.list
```

Show running processes

```
docker container top $(IMAGENAME)

```

## Build for Intel on Apple Silicon

docker buildx build --platform linux/amd64 -t $(IMAGENAME) -f $(DOCKERFILE) --load .

docker run -it $(IMAGENAME) sh

Clean

```
docker system prune -a
```

---

difference between build time env vars and run time env vars

docker-local:
	docker build -t climatedb-app-local . -f Dockerfile.web
docker-run:
	docker run -d --name climatedb-app-local -p 80:80 climatedb-app-local

docker-heroku-git:
	git add -u
	git commit -m 'heroku deploy'
	git push heroku tech/feb-2022-rebuild:main

docker-heroku-cli-m1:
	# heroku login
	# heroku container:login
	# heroku container:push web -a climate-news-db --recursive
	docker buildx build --platform linux/amd64 -t climate-news-db . -f Dockerfile.web
	docker tag climate-news-db registry.heroku.com/climate-news-db/web
	docker push registry.heroku.com/climate-news-db/web
	heroku container:release web -a climate-news-db

docker-heroku-cli-intel:
	heroku login
	heroku container:login
	heroku container:push web -a climate-news-db --recursive
	heroku container:release web -a climate-news-db

---

docker compose - https://nickjanetakis.com/blog/best-practices-around-production-ready-web-apps-with-docker-compose

`docker-compose.override.yml`

healthchecks

.env

multi stage dockerfiles

build arguments

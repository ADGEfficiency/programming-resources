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
docker exec -it
```

Exec = executes on runnin container, run creates temporary container

Use env from list of env variables:

```
docker run $(IMAGENAME) --env-file env.list
```

## Build for Intel on Apple Silicon

docker buildx build --platform linux/amd64 -t $(IMAGENAME) -f $(DOCKERFILE) --load .

docker run -it $(IMAGENAME) sh

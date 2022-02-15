dockerfile versus image versus container
- run time versus build time

Build from Dockerfile

```
docker build - < Dockerfile

docker build -t name . -f path/to/Dockerfile
```
https://hub.docker.com/r/amazon/aws-lambda-python
docker run -it $(IMAGENAME) sh

docker run $(IMAGENAME) --env-file env.list

# make docker-local DOCKERFILE=$(DOCKERFILE) IMAGENAME=$(IMAGENAME)
docker-local:
	# builds
	docker buildx build --platform linux/amd64 -t $(IMAGENAME) -f $(DOCKERFILE) --load .
	# runs
	docker run -it $(IMAGENAME) sh

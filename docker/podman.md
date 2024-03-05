[Podman vs Docker: Comparing the Two Containerization Tools](https://www.linode.com/docs/guides/podman-vs-docker/)

## Docker vs Podman

Both Podman and Docker are containerization tools. With either one, you can fully start up, deploy, and manage containers.

However, each tool has its pros and cons. These next couple of sections explore each, providing a list to compare and contrast the two containerization engines.

Afterwards, keep on reading to see our advice on which tool to use when.

## Docker Pros and Cons

Docker Pros:

    Simple and approachable. Docker’s commands are designed to be relatively simple and easy to use. Alongside that, Docker maintains one of the most frequently used registries for container images.

    The Docker Hub holds a wide collection of well-maintained container images, many of which are composed and updated officially. This makes it relatively easy to, for example, pull a container image for a LAMP stack and start working quickly with Docker.

    Popular. Docker’s widespread usage means you are more likely to encounter it anywhere that works with containers. It also means you have a vast and easily accessible collection of user documentation and troubleshooting to pull from.

Docker Cons:

    Daemon-based architecture. Docker runs on a long-running daemon process, which may pose security concerns for some. Additionally, that daemon process runs with root privileges. Thus, even limited users executing Docker commands are getting those commands fulfilled by a process with root privileges, a further security concern.

## Podman Pros and Cons

Podman Pros:

    Daemonless architecture. Podman directly interacts with containers and container images, without a long-running daemon process. Doing so reduces exposure to security risks.

    Rootless processes. Because of its daemonless architecture, Podman can perform truly rootless operations. Users do not have to be granted root privileges to run Podman commands, and Podman does not have to rely on a root-privileged process.

    Access to image registries. Podman can find and pull container images from numerous registries, including the Docker Hub. This means, with a little configuration, Podman can access the same image registries as Docker.

Podman Cons:

    Limited build features. Podman concerns itself primarily with running and managing containers. It can build containers and render them as images, often effectively for many use cases. However, its functionality for doing so represents a limited portion of the Buildah source code.

    Instead, Podman endorses using Buildah as a complimentary tool for more feature-rich container building and fine-tuned control over the process.

[Deployment and infrastructure for a bootstrapped webapp with 150k monthly visits | Caspar von Wrede](https://casparwre.de/blog/webapp-python-deployment/)

I use 2 VPS (virtual private servers) running on DigitalOcean
The database is Postgres and is fully managed by DigitalOcean
I use a blue-green deployment
Deployment is done via git and ssh.
No CI/CD
No containers
Absolutely no Kubernetes

## Blue-green deployment

There are two identical and independent servers hosting the application. One is called “green”, the other “blue”.

There is a shared production database that both servers can access.

There is a quick and painless way of routing traffic to the green or the blue server.

The magic thing that makes it all possible is a floating IP address from DigitalOcean.

This is a publicly-accessible static IP addresses that you can assign to a server and instantly remap between other servers in the same datacenter. 

---

I do have a bunch of end-to-end tests, but I run them locally.

[Zero-Downtime Deployments with Docker Compose - Max Countryman](https://www.maxcountryman.com/articles/zero-downtime-deployments-with-docker-compose)

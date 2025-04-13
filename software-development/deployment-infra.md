[Ask HN: What do you monitor on your servers? | Hacker News](https://news.ycombinator.com/item?id=41240379)

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

[Deployment and infrastructure for a bootstrapped webapp with 150k monthly visits | Hacker News](https://news.ycombinator.com/item?id=32986969)

I think we can safely put docker images (not k8s) in the "boring technology" category now. You don't need k8s or anything really. I like docker-compose because it restarts containers. Doesn't need to be fancy. 

---

Blue/green usually implies some sort of load balancing, here OP is just flipping a switch that changes a hostname and flips the roles of blue/green from staging/production.

[My frugal indie dev startup stack (2022) | Hacker News](https://news.ycombinator.com/item?id=37031944)

I would NOT call this frugal at all, actually. You are overspending in a lot of places and under spending in others. $281.32 per month for such a simple service is...astonishing. Change Vercel and Intercom with Cloudflare and Chatwoot (self hosted), and you have saved $120/mo. Get rid of Ahrefs for Ubersuggest (or no SEO tool at all) to save about $80 more. That leaves you with $81.32/mo. If you try even harder, you can easily bring that under $50.

[Zero-Downtime Deployments with Docker Compose - Max Countryman](https://www.maxcountryman.com/articles/zero-downtime-deployments-with-docker-compose)

[12 Ways to Prepare your Monolith Before Transitioning to Microservices](https://semaphoreci.com/blog/monolith-microservices)

[How to Improve Your Monolith Before Transitioning to Microservices | Hacker News](https://news.ycombinator.com/item?id=32000598)

[Static Analysis at GitHub – Communications of the ACM](https://cacm.acm.org/practice/static-analysis-at-github/)

[The Architecture Behind A One-Person Tech Startup](https://anthonynsimon.com/blog/one-man-saas-architecture/)

Django monolith, I'm now using Postgres as the app DB, ClickHouse for analytics data, and Redis for caching. I also use Celery for scheduled tasks, and a custom event queue for buffering writes. I run most of these things on a managed Kubernetes cluster (EKS).

Why k8s - zero downtime deploys, autoscaling, health checks, automatic DNS / TLS / ingress rules.

Cluster in private network.

Cloudflare proxying all traffic to an NLB (AWS L4 Network Load Balancer). This Load Balancer is the bridge between the public internet and my private network. Once it receives a request, it forwards it to one of the Kubernetes cluster nodes. These nodes are in private subnets spread across multiple availability zones in AWS. It's all managed by the way, but more on that later.

"But how does Kubernetes know which service to forward the request to?" - That’s where ingress-nginx comes in. In short: it's an NGINX cluster managed by Kubernetes, and it's the entrypoint for all traffic inside the cluster.

NGINX applies rate-limiting and other traffic shaping rules I define before sending the request to the corresponding app container. In Panelbear’s case, the app container is Django being served by Uvicorn.

It's not much different from a traditional nginx/gunicorn/Django in a VPS approach, with added horizontal scaling benefits and an automated CDN setup. It’s also a “setup once and forget” kind of thing, mostly a few files between Terraform/Kubernetes, and it’s shared by all deployed projects.

Flux automatically triggers an incremental rollout when there’s a new Docker image available, and keeps record of these actions in an "Infrastructure Monorepo".

My app containers auto-scale based on CPU/Memory usage. Kubernetes will try to pack as many workloads per node as possible to fully utilize it.

## CDN Caching

When defining the ingress rules for my app, the annotation cloudflare-proxied: "true" is what tells the Kubernetes that I want to use Cloudflare for DNS, and to proxy all requests via it’s CDN and DDoS protection too.

From then on, it’s pretty easy to make use of it. I just set standard HTTP cache headers in my applications to specify which requests can be cached, and for how long.

I use Whitenoise to serve static files directly from my app container. That way I avoid needing to upload static files to Nginx/Cloudfront/S3 on each deployment. It has worked really well so far, and most requests will get cached by the CDN as it gets filled. It's performant, and keeps things simple.

## App Caching

Besides static file caching, there's also application data caching (eg. results of heavy calculations, Django models, rate-limiting counters, etc...).

On one hand I leverage an in-memory Least Recently Used (LRU) cache to keep frequently accessed objects in memory, and I’d benefit from zero network calls (pure Python, no Redis involved).

However, most endpoints just use the in-cluster Redis for caching. It's still fast and the cached data can be shared by all Django instances, even after re-deploys, while an in-memory cache would get wiped.

## Rate Limiting

While I enforce global rate limits at the nginx-ingress on Kubernetes, I sometimes want more specific limits on a per endpoint/method basis.

For that I use the excellent Django Ratelimit library to easily declare the limits per Django view. It's configured to use Redis as a backend for keeping track of the clients making the requests to each endpoint (it stores a hash based on the client key, and not the IP).

## User Login Alerts

Additionally every time a user logs in, I send an automatic security email with details about the new session to the account’s email. Right now I send it on every new login, but I might change it in the future to skip known devices. It’s not a very “MVP feature”, but I care about security and it was not complicated to add. At least I’d be warned if someone logged in to my account.

## Scheduled Jobs

My setup is actually pretty simple, I just have a few Celery workers and a Celery beat scheduler running in the cluster. They are configured to use Redis as the task queue. It took me an afternoon to set it up once, and luckily I haven’t had any issues so far.

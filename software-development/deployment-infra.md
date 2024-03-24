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

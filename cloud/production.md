
[How to sleep at night having a cloud service: common Architecture Do's ](https://danielsada.tech/blog/cloud-services-dos/)

Simple:

- infra as code,
- CI/CD,
- load balancing,
- rayids, correlations / UUIDs for requests
    * allows tracking a request through it's lifecycle

Medium:
- centralized logging,
- monitoring agents
    * how to tell your service is down
- autoscaling based on load,
- experiment system - roll out to 1% of your users,

Hard:
- blue-green deployments
- anaomly detection, automatic mitigations

---

Python Anywhere, Netfly, Fly, Heroku

https://www.saltstack.com/try-salt-open/, Ansible, terraform

[hjacobs/kubernetes-failure-stories](https://github.com/hjacobs/kubernetes-failure-stories) - a compiled list of links to public failure stories related to Kubernetes

[Production Readiness Checklist](https://www.gruntwork.io/devops-checklist/)

## Scaling Talks

[Scaling Instagram Infrastructure](https://youtu.be/hnpzNAPiC0E)
- scaling is multidimensional
- distinction between storage & compute
- compute is stateless, temporary data that can be reconstructed from global
- master + multiple replicas (support high reads) - all in postgres
- feeds in cassandra - full replicas
- django, celery, rabbitMQ
- memcache, rather than going to the database (problem with keeping cross data center memcache's consistent)
- select(*) count versus select count
- scale = about minimizing CPU instructions (demand) and minimize server (supply)
- monitor (data collection, alerts + event logs), analyze, optimize
- constantly profile running code - easy access to profile logs
- time series plots
- provide feedback to programmer - how much this function would cost
- target for optimization = stable, and often used functions (Cython or C++)
- parallel processing limited by memory
- code takes up lots of memory (-O for no docstrings, remove dead code)
- sharing more between processes - sharing configuration
- network latency (problem for scaling servers) - asyncio
- problems with branches - context switching, surprises
- one master branch - no branches, rely on continuous monitoring
- staged rollouts of features, load testing using artificial load
- 40-60 rollouts per day, 1 hour to rollout a commit from master
- code review, unit test
- do computation at read time, rather than upload time
- looking at jit

[The Evolution of Reddit.com's Architecture](https://youtu.be/nUcO7n4hek4)

- storing list of id's in memcache, retrieve info from database via foreign key
- update cache in place rather than re running query (after new vote) - read, mutate, write (race condition)
- observability before you can solve a problem
- partitioning event handling to fix throughput
- if you are denormalizing, need tools for healing
- resource quotas to stop one service crashing entire site
- sanity checking on resource termination - am I terminating a large % of our traffic?
- observability, use safeguards, simple + easy to understand

[How Slack Works](https://youtu.be/WE9c9AZe-DY)

[This is how I use the good parts of @awscloud , while filtering out all the distracting hype.](https://twitter.com/dvassallo/status/1154516910265884672)
- I can’t emphasize enough how important it is that you can easily start your entire application on your laptop, with one click.


## Machine Learning Specific

[Deploying a machine learning model to the cloud using AWS Lambda - Dr. Benjamin Weigel](https://youtu.be/4ocbx9IeBMU)

[A case for declarative configurations for ML training](https://blog.maiot.io/declarative_configs_for_mlops/)

Infrastructure as code
- avoid environment drift, and to ensure idempotent operations
- read the infrastructure configuration and you’ll know exactly how the resulting environment looks like
- you can rerun the provisioning without side effects, and your infrastructure has a predictable state

Immutable infrastructure
- updates, fixes and modifications are only possible through new deployments of your infrastructure
- interaction between a provisioned infrastructure and new code happens only through automation

Importance of interfaces
- make automation possible

> if you don’t understand where your code is run, you don’t understand your code

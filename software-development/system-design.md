[Sacrificial Architecture](https://martinfowler.com/bliki/SacrificialArchitecture.html)

The best code you can write now is code you'll discard in a couple of years time.

Much thinking on software architecture is how to facilitate that kind of longevity. Yet success can also be built on the top of code long since sent to /dev/null.

Indeed it's a common pattern to see people coming into a maturing code base denigrating its lack of performance or scalability. But often in the early period of a software system you're less sure of what it really needs to do, so it's important to put more focus on flexibility for changing features rather than performance or availability. 

[Monolith First](https://martinfowler.com/bliki/MonolithFirst.html)

Monolith First strategy is recommended by Martin Fowler
- Successful microservices usually evolved from monoliths that grew too big
- Systems built as microservices from scratch often end up in serious trouble
- Even microservice advocates acknowledge significant MicroservicePremium cost

Why start with monolith
- YAGNI principle: unsure if application will be useful to users
- Better to scale successful but poorly designed system than inverse
- Prioritize speed and feedback cycle time initially
- Avoid microservices premium drag during early phases

Boundaries are critical but hard to get right
- Microservices require stable, well-defined service boundaries (BoundedContexts)
- Even experienced architects struggle with boundaries initially
- Refactoring between services much harder than within monolith
- Building monolith first helps discover correct boundaries

Different approaches to monolith-first strategy
- Carefully designed modular monolith (theoretical but few success stories)
- Gradually peel off microservices at edges (common approach)
- Replace monolith entirely as SacrificialArchitecture
- Start with coarse-grained services then break down

Counter arguments for microservices-first
- Gets teams used to microservice development rhythm from start
- Enforces separate team structure from beginning
- Easier to scale development effort when needed
- More viable for system replacements with known boundaries
- Requires existing microservices experience in team

Current state of advice
- Limited anecdotes and evidence available
- All advice should be considered tentative
- Each approach has trade-offs

Key constraints
- Arbitrary systems can't always be broken into microservices
- Many systems acquire too many dependencies between modules
- Successful decomposition requires good modular design to start

---

Monolith first is generally recommended
- Break off services only when infrastructure demands make it logical
- Requires engineers to maintain proper domain separation within single codebase
- Avoids premature complexity of microservices

Issues with poor domain separation
- Engineers who can't separate domains in monolith will do even worse with microservices
- Poor separation leads to worse mess in distributed system
- Often separation is done by technical boundaries rather than domain boundaries

Companies lack proper domain-driven practices
- Few companies do user story mapping or event storming
- DDD is mentioned but rarely practiced
- Lack of proper planning leads to technical rather than domain boundaries

Modular monolith approach recommended
- Build monolith from modular components
- Use proper libraries and modular design patterns
- Properly designed monoliths are already modular (since 1970s)

Conditions for transitioning to microservices
- Product pivots have slowed down
- At least 3 senior engineers for transition leadership
- Already containerized infrastructure with orchestration
- Team skilled with containers, networking, testing
- Start with fire-and-forget services behind queues

Amazon Prime Video example
- Reduced costs by 90% by switching from microservices back to monolith
- Shows microservices aren't always the better solution

Testing and infrastructure complexity
- Microservices create significant testing challenges
- Can't run everything locally
- Requires complex infrastructure bridges and security layers

Design considerations for scaling
- Focus on what actually needs to scale (CPU/memory intensive operations)
- Don't create services based on OOP thinking (Person service, Order service)
- Design stateless services for components that need to handle large loads


[How we built ngrok's data platform-ngrok](https://ngrok.com/blog-post/how-we-built-ngroks-data-platform)

[In defense of simple architectures](https://danluu.com/simple-architectures/)

[personal-server/README.md](https://github.com/erebe/personal-server/blob/master/README.md) - how I manage my personal server in 2023.

[Systems design for advanced beginners](https://robertheaton.com/2020/04/06/systems-design-for-advanced-beginners/)

API.

API client libraries that allow programmers to write code that works with the API.

Services:

- Webhooks - to notify users when something happens to their account, such as “order placed”
- User password authentication - to securely log users in
- SQL database - the main Steveslist data store. Needs to be highly scalable and reliable
- Free-text searching system - to power the search box where people can look for broad search terms like “TVs” or “motorbikes”
- Internal tools - to help us administer the Steveslist platform, and to take actions like issuing sternly-worded warnings to malicious users
- Cron jobs - to run regular tasks that do anything from generating invoices, to billing customers, to sending as much of our users’ data as possible to third-party ad networks
- “Pubsub” system - to allow us to take asynchronous actions on different trigger events (such as “when a new user signs up, send them a welcome email”)
- Big data analytics system - to allow us to run enormous queries over the entirety of Steveslist’s data

## What is a server?

A server is a computer that runs on a network and listens for communications from other computers. When it receives some data from another computer it performs some sort of action in response and - usually - sends back some data of its own.

A web server listens on a network for HTTP requests and sends back webpages and information in response. 

A database server listens for database queries and reads and writes data to the database that it is running.

## Webhooks

A webhook is an HTTP request that we send to our users whenever something interesting happens to their account.

Webhooks come with two main complications - security and reliability. First, let’s talk security. The endpoint to which the seller instructs us to send their webhooks is accessible to anyone on the internet.

## Password authentication

We mustn’t ever store passwords in their original, plaintext form, anywhere. 

We mustn’t store them in plaintext in a database, in a log file, or in any other part of our system. 

Instead, before storing a password, we must first hash it using a hash function such as bcrypt.

## Sharding

Sharding a database means splitting its data into chunks (or “shards”) and storing each chunk on a separate machine. 

All of the machines that make up a database are together known as a database cluster. 

This means that we need an extra “routing” layer in front of our database, which knows which database machine is able to service which queries. 

We could either make our application servers (the servers that execute our code) responsible for knowing the mapping of user IDs to database shards, or have a centralized “router” that all servers send their requests to, and which is responsible for working out the appropriate machine to forward the request on to.

## Replication

To mitigate the fallout of a database-related disaster, we replicate our data across multiple machines in (close to) realtime.

The process of replication is conceptually quite straightforward. Whenever new data is written to our database, we copy it to multiple machines. 

Replication can be handled either synchronously or asynchronously. 

Realtime replication has two main benefits.

First - if one of our database servers explodes, catches fire, or otherwise stops working, we have multiple almost-perfect copies of it that can seamlessly pick up the slack. In a straightforward, vanilla failure, users of our services may never know that anything has gone wrong. 

The second benefit of replication is that we can distribute queries for the same data across multiple database servers. 

Replication is complicated by two inconvenient facts about the real world. 

First - database operations randomly fail sometimes. When we attempt to replicate our data from one server to another, things will occasionally go wrong, causing our machines to become out of sync, at least for a period. 

Second, even in periods of smooth operation, replication is not instantaneous. 

## Backups

In addition to realtime replication, we also store regular backups of our entire database in order to protect against catastrophic disaster. 

## Freetext Search

In the background we also copy data from our SQL database into an Elasticsearch database, and send any full-text search queries made via our search box to Elasticsearch.

## Pubsub

Publish-subscribe or “pubsub”. 

When a trigger action is performed, the code that performs it “publishes an event” describing the action, such as NewListingCreated or SubscriptionCardDeclined. 

The words “event” and “publish” are quite loosely defined in this context, and don’t have a rigorous technical definition. An event is just some sort of record of something that happened, and to publish an event just means that you somehow make a note that something happened. 

## More

Security

    HTTPS and other forms of encryption
    Two-factor authentication
    SAML
    Secret key management

Server management

    Deploying new code
    AWS and competitors
    Terraform
    Load balancers
    Containers
    Alerting when code breaks

Big data

    Map-reduce and other big data jobs
    Machine learning
    User tracking

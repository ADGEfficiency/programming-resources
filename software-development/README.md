[All Programming Philosophies Are About State | World of BS](https://www.worldofbs.com/minimize-state/)

Object-Oriented - Modifying a lot of state at once is hard to get correct; encapsulate subsets of state into separate objects and allow limited manipulation of the encapsulated sub-state via methods.

Functional - Modifying state is hard to get correct; keep it at the boundaries and keep logic pure so that it is easier to verify the logic is correct.

Declarative - Modifying state is hard to get correct; use a language to describe how state should be manipulated and allow the machine to determine the steps required.

Imperative - Modifying state is hard to get correct; minimize the number of conceptual layers between how the computer operates and how the code is written.

Monolith - Modifying state distributed among many services is hard to get correct; keep it centralized.

Service-Oriented-Architecture - Modifying all of the state in one service is hard to get correct; distribute it among multiple services.

MicroServices - Modifying any state in a service is hard to get correct; have many services that are primarily stateless.

[All programming philosophies are about state | Hacker News](https://news.ycombinator.com/item?id=34674814)

OO, functional, imperative, declarative: these are ways of controlling dispatch.

Monoliths and microservices are both ways to organize codebases and teams of programmers and control whether dispatch is intermediated by the network or not. Either way, both of these options are implemented by some kind of language in the previous category (OO, functional, imperative, or declarative).

Service-oriented architecture applies to both monoliths and microservices, and very few programmers still working in the industry have really seen what an alternative to service-oriented architecture actually looks like. 

[What distinguishes great software engineers?](https://faculty.washington.edu/ajko/papers/Li2019WhatDistinguishesEngineers.pdf)

## Personality

- Continuously improving
- Open-minded
- Executes
- Self-reliant
- Self-reflecting
- Persevering
- Curious
- Craftsmanship
- Turn ideas into reality
- Passionate
- Focused
- Systematic
- Adapts to new settings
- Productive
- Aligned with organization's goals
- Data-driven
- Hardworking
- Willing to enter the unknown

## Decision-making

- Updates decision-making knowledge
- Grows ability to make good decisions
- Sees the forest and the trees
- Handles complexity

## Knowledgeable about:

- Tools and building materials
- Their technical domain
- Engineering processes
- Customers and business
- Coworkers and organization

## Teammate Interactions

- Honest
- Does due diligence beforehand
- Asks for help
- Is a good listener
- Manages expectations
- Integrates others' understandings
- Doesn't make it personal
- Walks-the-walk
- Resists external pressure

## The Engineer's Code

- Pays attention to coding details
- Fits with pieces around it
- Makes informed trade-offs
- Evolving
- Elegant

## External Attributes

- Has a good reputation
- Creates shared understanding
- Creates shared success
- Well-mannered
- Creates a safe haven
- Mentoring
- Challenges others to improve
- Personable
- Trades favors

## Internal Attributes

- Long-termed
- Creative
- Anticipates needs
- Uses the right processes during construction

[Things I want as SRE/DevOps from Devs](https://oschvr.com/posts/what-id-like-as-sre/)

How can I check the health of the service ?
    Did you securely configured endpoints that I can ping periodically?
    Is it going to use the same port as the service ?

How can I safely and gracefully restart the service ?
    Does graceful shutdowns wait for inflight requests to finish?
    If I restart the service, will there be any disruption or performance degradation?

How and why would the service fail ?
    Does it has any external dependencies ?
    And what happens if it does ?
    Do you have a playbook, or sequence of steps, to bring the service back up?

Do you use appropriate logging levels depending on the environments ? i.e. (TRACE & DEBUG should not go to production)
    Are you logging to stdout ?
    What format of logs are you using, (JSON, PLAINTEXT)?

What kind of metrics are you exposing ?
    Are you measuring the RED signals?
        Rate (# of requests per second)
        Errors (# of errors per second) and
        Duration (time each request takes)

Is there any documentation/design specification for the service ?
    Are you using gRPC or REST ?
    How can I see the API contract?
    Do you have a OpenAPI/Swagger spec

How does the data flow through the service ?
    Do you have any PII/Sensitive data flowing through the service?
    Is any part of the data captured in the service logs?

What is the testing coverage for this service ?
    Do you wrote unit, integration tests for it?
    Is there a end to end test that I can run discard issues?

[The Product-Minded Software Engineer - The Pragmatic Engineer](https://blog.pragmaticengineer.com/the-product-minded-engineer/)

1. Proactive with product ideas/opinions. Proactive with product ideas/opinions
2. Interest in the business, user behavior and data on this
3. Curiosity and a keen interest in "why?"
4. Strong communicators and great relationships with non-engineers
5. Offering product/engineering tradeoffs upfront
6. Pragmatic handling of edge cases
7. Quick product validation cycles
8. End-to-end product feature ownership8. End-to-end product feature ownership
9. Strong product instincts through repeated cycles of learning

```
They ask a lot of questions to understand exactly why the product feature is being built.

They bring suggestions and tradeoffs to the table, some of which are included in the revised spec.

They build the feature quickly, getting early feedback, as they do.

After shipping the feature, they actively follow up to understand if the feature lives up to the expectation.

When it does not, they dig deep, to understand why it did not and learn something new about product usage in the real world.
```

[Keep your source code SIMPLE](https://kevingoslar.medium.com/keep-your-source-code-simple-d5873cb854dc)

Strong-enough data: avoid stringly-typed data structures

Immutable where possible: avoid unexpected mutability

Misuse-proof APIs: make it impossible to use your APIs the wrong way
- one method instead of many, to avoid being called in the wrong order

Pure logic: separate processing from side-effects

Lean components: avoid large and complex pieces of code

Expressive errors: provide helpful error messages

[On the shoulders of the giants](https://www.lpalmieri.com/posts/2020-03-08-on-the-shoulders-of-the-giants/)

[Building Awesome Developer Tools - Lines Montani, PyCon 2019 India Keynote](https://youtu.be/Ivb4AAuj5JY)

everyone who writes code writes developer tools

programmable & extensible tools over fully integrated - better for devs, cheaper to build, reduces feature requests / features to build

favour being able to iterate over what a function returns than adding keyword args to that function

allow users to pass in a function to extend behaviour

an extensible library is one that provides composable primitives

tips
- callbacks,
- function registries (decoractors),
- single dispatch generic functions,
- entrypoints,
- avoiding IO


[Software development skills for data scientists](https://www.treycausey.com/blog/software_dev_skills.html)

- modular, re-usable code (DRY),
- refactoring,
- documentation,
- version control,
- testing,
- logging / monitoring,
- reviews,
- shell,
- aws.

[Software Development Waste](https://neverworkintheory.org/2021/08/29/software-development-waste.html) - [Hacker News discussion](https://news.ycombinator.com/item?id=28352075)

Building the wrong product
- product that does not address user business needs
- not doing research on users or businesses
- ignoring feedback, low user value features

Mismanaging backlog
- duplicating work, low value features, delaying bug fixes
- working on too many features simultaneously, imbalance of feature work and bug fixing, delaying testing or critical bug fixing 

Rework
- altering delivered work that should have been done correctly
- no clear definition of done

Unnecessarily complex solutions
- a more complicated solution than necessary
- a missed opportunity to simplify features, user interface, or code
- unnecessary feature complexity from the user’s perspective 
- unnecessary technical complexity
- duplicating code, lack of interaction design reuse, overly complex technical design created up-front

Extraneous cognitive load
- the costs of unneeded expenditure of mental energy
- suffering from technical debt,
- inefficient tools and problematic APIs, libraries, and frameworks 
- unnecessary context switching
- inefficient development flow
- poorly organized code 

Psychological distress
- burdening the team with unhelpful stress
- low team morale
- rush mode
- interpersonal or team conflict 

Waiting/multitasking
- cost of idle time, often hidden by multi-tasking
- slow tests or unreliable tests
- unreliable acceptance environment
- missing information, people, or equipment
- context switching from delayed feedback 

Knowledge loss
- cost of re-acquiring information that the team once knew
- team churn
- knowledge silos 

Ineffective communication
- incomplete, incorrect, misleading, inefficient, or absent communication
- team size too large
- asynchronous communication - distributed teams/stakeholders, opaque processes outside team
- imbalance - dominating the conversation; not listening
- Inefficient meetings (lack of focus; skipping retros; not discussing blockers each day; meetings running over (e.g. long stand-ups)) 

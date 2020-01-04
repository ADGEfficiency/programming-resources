[Manifesto](https://www.oreilly.com/ideas/a-manifesto-for-agile-data-science)

[Textbook](https://www.oreilly.com/library/view/agile-data-science/9781491960103/)

## Key ideas

Agile = iterative development of analytics applications

Agile software != agile data science.  Data introduces uncertainty.

Must ship - not agile if you don’t ship.  Tolerate lower code quality because lots of code thrown away.  Not always good, but eventually good.  

Build applications that describe the applied research process

Taking examples & adapting = fundamental to data science / programming

Simplicity is the heart of agility

Simple stack -> scalable and agile.  Scalable makes it simple

## Involve users early

Involve users at end of each sprint - ie at product ship - always ship every sprint.
- can ship at any level of data value pyramid (even lowest level)
- Involving users = part of using pyramid

### Generalists

Lone full stack developer

Generalists are needed - full stack development to sprint through the pyramid.  Small teams are better than large teams.  Iterative sharing of work.  Code review & pair programming - cross training between different systems, improve code quality and culture of inclusion.  Office design is a cheap way to improve productivity (cheaper than hiring new people).  Large format printing.

## Data value pyramid

Minimum atomic unit of data

Plumbing (data flows
Charts & tables
Reports
Predictions
Actions

Managed from the data level up

Can’t visualise single atomic record = platform has no base = platform weak

- climb up and down the data pyramid
- iterate on tables, charts and reports

## Ship intermediate output 

- even failed experiments.  Document and share incomplete assets
- describe the process - not just the end state
- Document, facilitate and guide exploratory data analysis to discover and follow critical path to compelling analytics product
Keep model consistent with the view - feature consistent with the data

Keep model consistent with the view 
- important for complex predictive models
- View to match the data models

Working software > documentation.  A good system is self documenting

Centred around the web app - most effective way to communicate.  Document insight as it occurs
- difference between delivering production software and actionable insights

Build feature at any level - move back (ie towards Spark) as it stabilises

Builds on pagination for minimal manipulation between backend and browsers.  Reduces complexity, unites data sceicntist and designer

Build features at any level - once they stabilise, move back towards spark

## Batch processing

Deploying in batch is easier - do it if you can

Think about where to put dat processing in the stack
- how do we compute/publish/consume data
- Where do we put the data processing

More batch processing = less time operating database features (better) = simpler and scalable = application that runs itself

1st order = preparing records in key/value stores (JSON) = most scalable, simpler than relational dB, easy operation

## Misc

SQL = good for simple queries, powerful and concise

Schema inherent in the data structure

Seralization = imposing structure

Create indexes in Mongo

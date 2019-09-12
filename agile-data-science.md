## Manifesto

https://www.oreilly.com/ideas/a-manifesto-for-agile-data-science

Agile = iterative development of analytics applications

Lone full stack developer

## Agile Data Science textbook

Iterate on tables, charts and reports
Ship intermediate output - even failed experiments.  Document and share incomplete assets
Prototype experiments
Integrate data insights into product
Climb up and down the data value pyramid
Describe the process - not just the end state

Working software > documentation.  A good system is self documenting
Responding to change

Document, facilitate and guide exploratory data analysis to discover and follow critical path to compelling analytics product

Build applications that describe the applied research process
Rapid prototyping
- Exploratory data analysis
- Interactive visualization
- Applied ML

Centred around the web app - most effective way to communicate.  Document insight as it occurs

Difference between delivering production software and actionable insights

Agile software != agile data science.  Data introduces uncertainty.

Must ship - not agile if you don’t ship.  Tolerate lower code quality because lots of code thrown away.  Not always good, but eventually good.  

Prototypes are financed on technical debt - the debt is only paid if the prototype is useful - if many prototypes are discarded then lots of technical debt never repaid

Generalists are needed - full stack development to sprint through the pyramid.  Small teams are better than large teams.  Iterative sharing of work.  Code review & pair programming - cross training between different systems, improve code quality and culture of inclusion.  Office design is a cheap way to improve productivity (cheaper than hiring new people).  Large format printing.

Simple stack -> scalable and agile.  Scalable makes it simple

Involve users early

Keep model consistent with the view - feature consistent with the data

Build feature at any level - move back (ie towards Spark) as it stabilises

Taking examples & adapting = fundamental to data science / programming

Create indexes in Mongo

Deploying in batch is easier - do it if you can

## Data value pyramid

Plumbing (data flows
Charts & tables
Reports
Predictions
Actions

Managed from the data level up

Can’t visualise single atomic record = platform has no base = platform weak

Involve users at end of each sprint - ie at product ship - always ship every sprint.
- can ship at any level of data value pyramid (even lowest level)
- Involving users = part of using pyramid

Builds on pagination for minimal manipulation between backend and browsers.  Reduces complexity, unites data sceicntist and designer

Keep model consistent with the view 
- important for complex predictive models
- View to match the data models

Build features at any level - once they stabilise, move back towards spark

Think about where to put dat processing in the stack
- how do we compute/publish/consume data
- Where do we put the data processing

More batch processing = less time operating database features (better) = simpler and scalable = application that runs itself

1st order = preparing records in key/value stores (JSON) = most scalable, simpler than relational dB, easy operation

---

Minimum atomic unit of data

Simplicity is the heart of agility

SQL = good for simple queries, powerful and concise

Schema inherent in the data structure

Seralization = imposing structure

Expose derived data

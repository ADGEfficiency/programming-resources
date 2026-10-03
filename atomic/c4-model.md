---
id: c4-model
aliases: []
tags:
  - programming
  - software-architecture
  - diagramming
  - book-review
---

Architecture = significant design decisions that shape form & function of a system, where significant is hard to change:

- Technology: Programming languages, frameworks, target deployment environments
- Elements: How software is decomposed
- Relationships: Dependencies & interactions between elements

Encourage including technology choices in software arch. diagrams

Suggest unidirectional arrows only

Notation should be
- consistent
- easy to read, accessible
- used to differentiate elements & relationships

Titles should show both diagram type and it's scope

Layout - keep placement consistent across different levels

Sizing - keep mostly the same size

Naming
- Name
- [Type: technology]
- Description, sumamry of responsibilities

Relationships
- unidirectional
- arrows represent dependecy/initiation - from initiating (active) to receiving (passive)

## Software system / system context diagram

- aka application, product, service
- delivers value to users
- something one team builds/owns/can see all the code of

Systems should have name & description

System landscape is similar, but shows more systems (not directly related ones)

## Container diagram

Containers (applications & data stores)

- runtime concept, boundary around code or data
- have some isolation around them
- datastores are often isolated at schema levels

Container should have labels of name, technology, description

Relationships should have description, technology, can denote sync/async

### Applications

- Servers
- Client side webapp/desktop app
- Mobile app
- Serverless function
- Shell script

### Datastore

- Database
- Blob storage
- File system

## Components

- collection of code (classes, funnctions etc)

Code elements (implement components)

## Dynamic Diagrams

Documents execution

Use 1., 2. etc to label the steps

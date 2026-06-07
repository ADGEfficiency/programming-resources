---
id: python-clean-code
aliases: []
tags:
  - python
---

https://github.com/cosmicpython/book

Software architecture patterns in Python book

https://medium.com/gdg-vit/clean-architecture-the-right-way-d83b81ecac6

Entity = core business object

Repository = entities are used in repository

Service = higher level business logic

Interface adapters

---

https://python-patterns.guide/

----

Clean architecture in ML means asynch deployment -> async learning (separation of dataset gathering and learning)

[Three Techniques for Inverting Control, in Python](https://seddonym.me/2019/08/03/ioc-techniques/)

Polymorphism = interact with objects without knowing their type

Duck typing = interact with explicitly declaring an interface

1. dependency injection

```python
def hello_world(output_function):
    output_function("Hello, world.")


hello_world.hello_world(output_function=print)
```

Use if your dependency is unknown at runtime

2. registry

through configuration (dict, to options) or subscription (list, to events)

Use if your dependency is fixed

3. monkey patching

changing at runtime (without changing source)
- abuse of code - you don't know how it will be modified at runtime


[Moussa Taifi: Clean Machine Learning Code: Practical Software Engineering... | PyData New York 2019](https://www.youtube.com/watch?v=PEjTAJHxYPM&list=WL&index=62&t=0s)

Cost of change versus responsiveness to change

Loose coupling
- less well known = less coupled

Group things that change for different reasons
- local change only

Protect your business logic from things that change

Test in isolation = good sign

```python
#  should all this be on one class?
model.fit()
model.predictr()
model.transform_features()
model.metrics()
```

picture at 21:00

21:57

If an sbject knows too much == time to reverse dependencies

[Clean Machine Learning Code](https://towardsdatascience.com/clean-machine-learning-code-bd32bd0e9212)

[cosmicpython/book](https://github.com/cosmicpython/book) - A Book about Pythonic Application Architecture Patterns for Managing Complexity

DIP
1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.

Dependency = knows about or needs another module


[Clean Architectures in Python - Leonardo Giordani - textbook](https://github.com/ADGEfficiency/programming-resources/blob/master/python/clean-architectures-in-python.pdf)

[Clean Architectures in Python - Leonardo Giordani - PyLondinium19 - youtube](https://www.youtube.com/watch?v=7Wwrv490rK4)

(in) entities, use cases, gateways, external systems (out)

talk inwards with simple structures - either language (list dict) or defined in layer

outwards through interfaces

uc = Use_Case(database)

result = use_case.execute(args) (only execute)

testability, ease of change

layer = data transformation (data being transformed at each step)

layering = separating concerns (same idea as microservices)

---

## Key takeaways

Good software architecture minimizes the cost to change it

Depend on stable components

Simple data structures that are convenient for the higher levels

Independence allows testing and deployment

## Independence

Independent development and deployment
- goal = deployment with a single action
- isolating components helps with scaling

## Dependency

A ----> B
- dependency
- B is protected
- A depends on B
- A knows about B, implements B
-
Sometimes we want to use partial boundaries

## Changing code

Easy/hard to make changes to system
- leave options open
- decisions about details can be delayed until we have more info
- maximize the number of decisions not made

Interfaces allow inversion - change function without changing interface

Group things that change
- for the same reasons
- at the same time

## Value of software

1. function / behaviour
2. structure

> behavior is urgent but not always particularly important. Architecture is important but never particularly urgent.

Perfect function but impossible to change versus doesn't work but easy to change

Leave options open
- challenge is not to get it to work
- challenge is deployment, maintenance and development

If details are left open, decisions about details can be delayed until we have more info

Related classes should be released together

Group things that change for the same reasons at the same time

Maintainability is more important than usability

Confining changes -> independent deployability

Depending on one component means you depend on all components

## Testing

Testing = shows correctness by failing to show incorrectness

Depend on nothing
- independently deployable
- support development, not operation

If you can't run tests without the GUI, the GUI isn't a plugin

Want to be able to test high level policies (business rules) without the details (ie GUI, DB)
- 'test api' hides structure of app from tests

## Objects

Classes represent real things - but they aren’t those real things!

Representatives of things don’t share the relationships of the things they represent

Interface = abstract class with abstract methods

```python
class Base
```

Derived class should be usable through the base class interface, without user needing to know the difference

## SOLID

- only one reason to change
- add new code, leave existing
- allow substitution
- don't depend on things you don't use
- details depend on policies

A class should have only one reason to change

### S = SRP = Single responsibility

Only one reason to change

Responsible to one actor only

Draw boundaries around things that change for different reasons at different rates

### O = OCP = Open Closed

The open close principle - modules should be open for extension but closed for modification

Add new code, leave existing

Separate things that change for different reasons
- some duplicate code is OK if the rate of change will be different

### L = LSP = Liskov Substitution

Schema allows interchangeability

Substitute components without changing the thing using them

### I = ISP = interface segregation

Don't depend on things you don't use

`A -> C <- B`

`A -> Ai -- C -- Bi <- B`

C implements the interfaces, not dependent on `A` or `B`

### D = DIP = Dependency Inversion

Details depend on policies

Low level depends on high level

Don't depend on volatility

## Software architecture

Architecture = design decisions that make a system **easier or harder to change**
- changing requirements mean change always required
- want to minimize resource to build and maintain

Architecture development is iterative
- a hypothesis that is tested through implementation

Architecture should clarify & expose behaviour
- behaviour should be a first class citizen

Architecture = what connections between which components

Depend in the direction of stability
- we need volatile components to deal with change
- concrete = volatile

Can't tell what an app does by the high level architecture
- instead you see the framework + elements of the framework

## Clean architecture

Spherical
- unstable/volatile components on the outside
- stable components in the middle

Unstable components depend on stable components
- don't depend on unstable components

Use case independence of framework = allows testing without framework

Stable components should not know about the low level details
- your business rules don't care about what database you are using

### Business rules

How we make/save money

Independent of substrate

'Critical business data' = exists outside of computer

Abstract

Stable

Independent

Unaware of the implementation details

Two kinds of business rules
  1. true across many applications
  2. ones that are specific

### Implementation

Concrete

The details

Unstable

Dependent

### Data flow in a clean architecture

Strict about the data flow (i.e. the communication)
- communication is inwards
- from the implementation to the business

Communication = unrestricted within a layer

Formats declared in low level shouldn't be used in higher level

Data that crosses boundaries should be simple (JSON, CSV etc)

Convenient for higher level

## The full clean architecture

Business rules (aka entities)
- business rules
- innermost layer
- enterprise business rules

Use cases
- know about and use the entities
- rules that specify when critical business rules invoked
- application specific business rules
- processes that happen in in the application
- small actions
- separate from entities - change for different reasons

Controllers
- interface adapters
- convert data from use case to details, also from external into internal
- gateways
- presenters

Interfaces
- glue code to work with frameworks & drivers
- UI
- web (The web is an I/O device)
- databases

## Presenters & views

Presenter = testable, takes data & formats for the views

View = loads data from the view model

## Databases

Create/read/update/delete

`gateway.findLastNames(user_name)`

These gateways allow the database to be replaced by test stubs

## Frameworks

Forced to marry some frameworks (ie python stdlib)

Only depend on stable frameworks - put interfaces between unstable & app

## Main

Main is the ultimate detail
- depends on everything

Loads up everything then hands off control to system
- initial conditions, configs, resources

External systems
- implement interfaces

API
- fixed collection of entry points (methods or objects)

## Interactor



## Further reading & watching

[The Clean Architecture - Robert C. Martin](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

[Principles of clean architecture](https://www.youtube.com/watch?v=o_TH-Y78tt4)

[Bob Martin SOLID Principles of Object Oriented and Agile Design  Yale](https://www.youtube.com/watch?v=TMuno5RZNeE)

The S.O.L.I.D. Principles of OO and Agile Design - by Uncle Bob Martin - [youtube](https://youtu.be/t86v3N4OshQ?t=203)

YOW! 2016 Robert C. Martin - The Scribe's Oath - [youtube](https://www.youtube.com/watch?v=X31Jc6HQUcs)

Craftsmen - control your environment - [youtube](https://www.youtube.com/watch?v=NZNhtYVb6H8)

# Testing

Testing is a foundational component of professional software development.  

My first three lessons as a software engineer were:

1. DRY,
2. YAGNI,
3. write tests!


# Why Test Software?

1. detect **broken software**,
2. write **better code**,
  - encourages functional decomposition,
  - allows safe refactoring.
3. **document** your code,
  - tests are executable documentation.
4. enable **teamwork**.


## 1. Testing Detects Broken Software

> I can use data to disprove a proposition, never to prove one.  I can use history to refute a conjecture, never to affirm it - Nassim Nicholas Taleb, Fooled by Randomness
[j]()

A test suite gives you verification that your code is *not broken*:

- we can check for correctness by *failing to show incorrectness*,
- it does not confirm that everything is correct!

The best we can do is show there isn't an error - it is never possible to prove that the software is correct.


## 2. Testing Makes You Write Better Code

### Encourages Good Function & Class Design

Tests force you to decompose code into functions - code that is difficult to test is often bad code:

- functions with 10+ inputs - tests are hard to write because we need to mock out 10+ things,
- long functions that do too much - hard to write separate tests for isolated logic.

If we are writing tests alongside our application, we must design the function so it can be tested - this forces us to think about what kinds of data structures will be used as input and output.

Test also force you to think about dependencies (you shouldn't need to run the database to test the UI).


### Allows Refactoring

Refactoring is the process of moving code without changing functionality - it's a key technique to tackling technical debt.

A well developed test suite allows *safe refactoring* - developer can change around code and rely on the signal from breaking existing tests that something is wrong.


## 3. Testing is Documentation

Tests act as a form of documentation - *executable documentation* (the best kind of documentation) that a computer can run and other developers can read.

Developers and teams with a healthy culture of testing read tests as the best way to


# Kinds of Tests

## In-line tests

Some tests can sit inside the application - `assert` statements are often cheap and guarantee run-time performance.

## Test Suites

A test suite is code separate to the application code - usually sitting alongside the application:

```
app/app.py
app/database.py
tests/test_app.py
tests/test_database.py
```

A test suite can have many different kinds of tests:

- unit tests - tests a single function/class in isolation,
- integration tests - test the interaction between multiple functions/classes,
- system tests - entire system mimicking how a user would use the system, interacts with real, external systems.

Other kinds of testing:

- online versus offline tests - tests that run locally versus tests that call cloud infrastructure,
- static typing tests (mypy, Typescript),
- dry-runs of infrastructure deployments.

## Computational versus Plumbing

From [Hacker News discussion](https://news.ycombinator.com/item?id=30942020):

- Computational code is business logic:
  - Usually well defined and doesn't change much,
  - Benefits from unit tests.
  - 
- Plumbing code is everything else:
  - Database access, showing data to users.
  - Need lots of mocks to test, changes a lot and is less clearly defined.
  - Benefits from integration and system tests.


## What Makes a Good Test Suite?

Fast

Easy to run:
- developers should be able to run the tests with a single shell command.

Automatic

Deterministic


## How Much Test Coverage?

100% test coverage means that every line of code is run during your tests:

- it doesn't mean they were testing meaningfully, or at all,
- 100% test coverage is 100% of lines, not 100% of inputs, cases or scenarios.

Too many tests can be bad:

> Focusing on 100% unit test coverage all the time—particularly in code that isn't doing simple, single responsibility stuff—often results (in my experience) in tests that overly mock other parts of the system. The net result is that you end up writing tests that simple check that "the code was written the way it is currently written".

A pragmatic approach is key - test where it's valuable.


## Test Suite Runners

You should know how to:

- run only tests that have failed previously - to avoid re-running tests that will always pass,
- stop after one failed test - to avoid waiting for all tests to run,
- run different sets of tests together,
- run tests in parallel.


## Property Based Testing


# Test Driven Development (TDD)

Test Driven Development (TDD) is a [software engineering philosophy](https://en.wikipedia.org/wiki/List_of_software_development_philosophies). 

TDD is a style of programming:

1. Write a test (before you write the function),
2. Check that the test fails,
3. Write the function until the test passes.

TDD gives a useful debugging cycle that helps to write code - most developers do something similar (running code until it works), without the formality or benefits of writing a test.


## TDD in Data Science

A lot of data science work is research - writing tests may not be justified

Testing of data science code often requires creativity

From [How to use Test Driven Development in a Data Science Workflow](https://towardsdatascience.com/tdd-datascience-689c98492fcc)

TDD is probably not worth the effort in the following scenarios:

- You are exploring a data source, especially if you do it to get an idea of the potential and pitfalls of said source.
- You are building a simple and straightforward proof of concept. Your goal is to evaluate whether further efforts are promising or not.
- You are working with a complete and manageable data source.
- You are (and you will be) the only person who is working on a project. This assumption is stronger than it might appear at first glance but holds for ad-hoc analyses.

In contrast, TDD is great in these cases:

- Analytics pipeline
- Complicated proof of concept, i.e. different ways to solve a subproblem, clean data etc…
- Working with a subset of data, so you have to make sure that you capture problems when new issues come up without destroying working code.
- You are working in a team, yet you want to make sure that no one breaks the functioning code.


# Introducing Tests to an Existing Codebase

It's common for projects to initially be developed without tests:

- not sure what you are building yet,
- still discovering product-market fit or program structure,
- manual testing is inexpensive,
- small team / only one developer,
- no consequences to something breaking.

This doesn't mean you shouldn't be writing tests - more experienced developers will write tests for proof-of-concept code as well as mission critical code.

Focus on the areas that are causing problems:

- if one function / feature breaks a lot, focus with a unit test there,
- if different parts of the app break, system tests.

Can start from:

- outside in - first write system tests, then move inwards,
- inside out - unit test problematic areas, then move outwards.

Take manual testing and automate it:

- codebases without automated tests are usually instead tested manually,
- a good starting point for tests is to write tests that mimic how a human would check the software was ok.


# Criticism of Testing

Watch out for:

- inverting application logic in a test,
- tests that focus more on testing mocks than application code,
- not testing failures are called when they should,
- not testing error messages.

[Why most unit testing is a waste](https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf)

[Unit Testing is Overrated](https://tyrrrz.me/blog/unit-testing-is-overrated) - [Hacker News Dicussion](https://news.ycombinator.com/item?id=30942020)


## Further reading

[Hello, Startup: A Programmer's Guide to Building Products, Technologies, and Teams - Yevgeniy Brikman](https://www.amazon.co.uk/gp/product/B016YZWDA4/ref=ppx_yo_dt_b_d_asin_title_o01?ie=UTF8&psc=1)

[Clean Architecture: A Craftsman's Guide to Software Structure and Design - Robert C. Martin](https://www.goodreads.com/book/show/18043011-clean-architecture)

[Stargirl Flowers Python testing style guide](https://blog.thea.codes/my-python-testing-style-guide/)

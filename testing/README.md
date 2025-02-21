# Testing

Agenda:
- why test software,
- four benefits of testing,
- kinds of tests,
- test driven development.


# My First Three Lessons

My first three lessons as a software engineer were:

1. DRY - don't repeat yourself,
2. YAGNI - you ain't gonna need it,
3. your code should be tested.

Testing is a foundational component of professional software development.  The ability thoroughly test code is an area where Excel is far behind software development - make use of this advantage.


# Why Test Software?

Testing has four benefits:

1. we can **detect broken software** - tests tell us something is wrong,
2. we will **write better code** - encouraging functional decomposition.
3. they **document your code** - tests are the best kind of documentation - executable documentation.
4. they enable **teamwork** - allows safe refactoring.


## 1. Testing Detects Broken Software

> I can use data to disprove a proposition, never to prove one.  I can use history to refute a conjecture, never to affirm it.
> 
> Nassim Nicholas Taleb - Fooled by Randomness

A test suite gives you a signal that your code is **broken**.  It gives you no signal of correctness.

We are limited to testing for for correctness by **failing to show incorrectness** - we cannot prove correctness. The best we can hope for is to show no error.

Yet even with this upper limit on the kinds of problems tests can help us solve, testing for brokenness will find many bugsand regressions.  


## 2. Testing Makes You Write Better Code

### Encourages Good Function & Class Design

Code that is difficult to test is often bad code.  If it is hard to test then this is a sign that the code will also be hard to use.

Testing is hard when:

- there is a lot test input data (usually created and sent into the function or class that is being tested),
- functions have lots of inputs,
- functions have lots of outputs.

Tests force you to decompose code into functions:

- functions with 10+ inputs - tests are hard to write because we need to mock out 10+ things,
- long functions that do too much - hard to write separate tests for isolated logic without calling a bunch of other logic.

If we are writing tests alongside our application, we must design the function so it can be tested - this forces us to think about what kinds of data structures will be used as input and output as we are writing the function.

Test also force you to think about dependencies - you shouldn't need to run the database to test the UI.


## 3. Testing is Documentation

**Tests are executable documentation** that a computer can run and other developers can read.  It's automatically validated constantly against different branches.  Comments and docstrings require manual updating.

Developers and teams with a healthy culture of testing read tests as the best way to understand how application code is working.


## 4. Testing Enables Teamwork

### Allows Refactoring

Refactoring is the process of moving around code without changing functionality - it's a key technique to tackling technical debt.  The functionality and value of a product to the business can be left in tact while developers move code around.

**A well developed test suite allows safe refactoring** - developers can change around code and rely on the signal from breaking existing tests that they have broken something somewhere else in the code base.


# Kinds of Tests

## In-line tests

Some tests can sit inside the application and be executed at runtime - `assert` statements are cheap and guarantee run-time performance by checking things like the length of this equals that.

## Test Suites

A test suite is separate to the application code - sometimes sitting outside the application:

```
app/app.py
app/database.py
tests/test_app.py
tests/test_database.py
```

A test suite can have many different kinds of tests - different teams can have different definitions of what makes a test an integration test.  It's important to communicate with your team about what a unit test means to you.

## Unit tests

Tests a single function/class in isolation.  Commonly done on stateless, pure function application code.

## Integration Tests

Test the interaction between multiple functions/classes.

## System Tests

Entire system mimicking how a user would use the system. Perhaps interacts with real, external, or cloud based systems.

## Static Typing

Static typing tests that the types of objects are what they should be - examples are mypy or Typescript.

Other kinds of testing:

- online versus offline tests - tests that run locally versus tests that call cloud infrastructure,
- dry-runs of infrastructure deployments.

## When to Use Unit Tests or Integration Tests

Computational Code versus Plumbing Code [Hacker News discussion](https://news.ycombinator.com/item?id=30942020):

- Computational code is business logic:
  - Usually well defined and doesn't change much,
  - Benefits from unit tests.

- Plumbing code is everything else:
  - Database access, showing data to users.
  - Need lots of mocks to test, changes a lot and is less clearly defined.
  - Benefits from integration and system tests.


## What Makes a Good Test Suite?

Fast & deterministic:
- randomness has a place in tests,
- but 'flakly' tests that pass or fail based on something other than a real error can cause real headaches.

Easy to run - developers should be able to run the tests with a single shell command.  Bonus if it's the same command in different repositories.

Automatic - run on events like pull request or branch merges.


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

See [notebook on Hypothesis](https://github.com/ADGEfficiency/teaching-monolith/blob/master/test-driven-development/hypothesis.ipynb).


# Test Driven Development (TDD)

Test Driven Development (TDD) is a [software engineering philosophy](https://en.wikipedia.org/wiki/List_of_software_development_philosophies) it is a style of programming.

The TDD approach to writing code is to:

1. Write the test before you write the function,
2. Check that the test fails,
3. Write the function until the test passes.

TDD gives a useful debugging cycle that helps to write code - most developers do something similar (running code until it works), without the formality or benefits of writing a test.

Even if all of the above were true, this doesn't mean you shouldn't be writing tests. More experienced developers will write tests for proof-of-concept code as well as mission critical code.  

TDD can be faster, even for code that they might throw away.

## TDD in Data Science

A lot of data science work is research - writing tests are often not justified for one off, experimental research work.

Testing of data science code often requires creativity, and there is much skill in understanding that testing this bit of code is worth it (due to some combination of the four benefits of testing) and that bit is not worth testing.

TDD is great when:

- Complicated proof of concept, i.e. different ways to solve a sub-problem, clean data etc,
- You are working with a subset of data, so you have to make sure that you capture problems when new issues come up without destroying working code,
- You are working in a team and you want to make sure that no one breaks the functioning code when developing new features.

TDD is maybe bad when:

- You are exploring a data source, especially if you do it to get an idea of the potential and pitfalls of an unknown dataset,
- You are building a simple and straightforward proof of concept. Your goal is to evaluate whether further efforts are promising or not,
- You are working with a complete and manageable data source,
- You are (and you will be) the only person who is working on a project. This assumption is stronger than it might appear at first glance but holds for ad-hoc analyses.

[How to use Test Driven Development in a Data Science Workflow](https://towardsdatascience.com/tdd-datascience-689c98492fcc)

# Introducing Tests to an Existing Codebase

It's common for projects to initially be developed without tests - this choice to write & maintain a test suite can be the correct engineering choice:

- when not sure what you are building yet,
- still discovering product-market fit or program structure,
- manual testing is cheap,
- small team / only one developer,
- no consequences to something breaking.

Tests should naturally focus on the areas that are causing problems:

- if one function / feature breaks, target tests there (unit and integration),
- if different parts of the app break when used together, write system tests.

The process of introducing tests can start from the:

- outside in - first write system tests, then move inwards,
- inside out - unit test problematic areas, then move outwards.

One starting point is to take the manual testing you already do and automate it:

- codebases without automated tests are usually instead tested manually by people,
- write tests that mimic how a human would check the software was not broken.


# Criticism of Testing

Testing is not without pitfalls - badly written tests can hurt more than they help.

Watch out for:

- inverting application logic in a test,
- tests that focus more on testing mocks than application code,
- not testing failures/errors are raised when they should,
- not testing error messages.

[Why most unit testing is a waste](https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf)

[Unit Testing is Overrated](https://tyrrrz.me/blog/unit-testing-is-overrated) - [Hacker News Discussion](https://news.ycombinator.com/item?id=30942020)

# Tests are a Tradeoff

Tests are a tradeoff between two things:

- the cost of writing tests,
- the cost of bugs.

Tests can be expensive to write if they are an afterthought, and/or the code is not written in way that is easy to test.

# Further Reading

[Hello, Startup: A Programmer's Guide to Building Products, Technologies, and Teams - Yevgeniy Brikman](https://www.amazon.co.uk/gp/product/B016YZWDA4/ref=ppx_yo_dt_b_d_asin_title_o01?ie=UTF8&psc=1)

[Clean Architecture: A Craftsman's Guide to Software Structure and Design - Robert C. Martin](https://www.goodreads.com/book/show/18043011-clean-architecture)

[Stargirl Flowers Python testing style guide](https://blog.thea.codes/my-python-testing-style-guide/)

[Favor real dependencies for unit testing](https://stackoverflow.blog/2022/01/03/favor-real-dependencies-for-unit-testing/)

[Too much of a good thing: the trade-off we make with tests](https://ntietz.com/blog/too-much-of-a-good-thing-the-cost-of-excess-testing/)

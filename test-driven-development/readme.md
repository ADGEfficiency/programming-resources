Test driven development is a software engineering philosophy - is isn't the only one (see [List of software development philosophies - Wikipedia](https://en.wikipedia.org/wiki/List_of_software_development_philosophies)).

## Further reading

[Hello, Startup: A Programmer's Guide to Building Products, Technologies, and Teams - Yevgeniy Brikman](https://www.amazon.co.uk/gp/product/B016YZWDA4/ref=ppx_yo_dt_b_d_asin_title_o01?ie=UTF8&psc=1)

[Clean Architecture: A Craftsman's Guide to Software Structure and Design - Robert C. Martin](https://www.goodreads.com/book/show/18043011-clean-architecture)

[Stargirl Flowers Python testing style guide](https://blog.thea.codes/my-python-testing-style-guide/)

## Criticism of TDD

[Why most unit testing is a waste](https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf)


## Why test

1. tests can tell you if you new code breaks anything
2. tests make you write better code
3. tests help others understand your code


## 1 - Verifying that you didn't break anything

A test suite gives you verification that functions are not broken
- check for correctness by failing to show incorrectness

It doesn't prove that everything is perfect!


## 2 - Writing better code

Tests force you to decompose code into functions
- code that is difficult to test may be too tightly coupled

We must design the function so it can be tested
- think about what kinds of data structures being used - favour simple (i.e. JSON) so that a test stub can be used
- if the code is hard to test because of too many use cases, this suggests the function is doing too much

Test also force you to think about dependencies (you shouldn't need to run the database to test the UI)



## 3 - Make code easier for others to understand

Tests also act as a form of documentation - executable documentation that a computer can run (and other developers can read)

Test code is as important as your source code


## A good test suite is

Fast

Easy to run 

Automatically run (pre commit git hook)

Deterministic


## Types of tests

Unit test = tests a function/class in isolation

Integration test = several functions/classes

System test = entire system mimicking how a user would use the system


## Test driven development

Write the test before you write the function

Check that the test fails

Write the function until the test passes


## Test driven development in data science

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

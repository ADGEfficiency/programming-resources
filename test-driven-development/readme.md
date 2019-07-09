Test driven development is a software engineering philosophy - is isn't the only one (see [List of software development philosophies - Wikipedia](https://en.wikipedia.org/wiki/List_of_software_development_philosophies))

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

We must design the function so it can be tested
- want to test database without the UI in place
- think about what kinds of data structures being used - favour simple (i.e. JSON) so that a test stub can be used


## 3 - Make code easier for others to understand

Tests also act as a form of documentation - executable documentation


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


## Python testing workflow

## pytest - [docs](https://docs.pytest.org/en/latest/)

`pytest` is a framework for managing tests of a Python program.  Pytest is run from the command line, and well look for functions beginning or ending in test (i.e. `test_db`) in files that begin or end with test (i.e. `test_app.py`).

```bash
pip install pytest

pytest tests
```

Pytest offers features to run only specific test, to parametrize tests with different inputs & expected outputs and to create fixtures (code to be shared between tests) - see my [notes on pytest here]().

## Hypothesis - [docs](https://hypothesis.readthedocs.io/en/latest/)

Hypothesis is a library that lets you do property based testing:

```python
def bad_adder(a, b):
    return abs(a + b)

@given(
    floats(allow_nan=False, allow_infinity=False),
    floats(allow_nan=False, allow_infinity=False)
)
def test_bad_adder(a, b):
    result = bad_adder(a, b)
    assert result == a + b
```

## Coverage.py - [docs](https://coverage.readthedocs.io/en/v4.5.x/)

Coverage tells you how much of your code base is tested:

```bash
pip install coverage

coverage run my_program.py arg1 arg2

coverage report -m
```

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

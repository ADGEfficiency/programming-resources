---
marp: true
theme: uncover
size: 16:9
paginate: true
header: 'Tests as Documentation'
footer: 'Adam Green - Kiwi Pycon 2025'
---

# Tests as Documentation: A Testing Philosophy

---

first lesson i learnt as a data scientist, the thing i value the most when i compare to excel based workflows

---

## Tradeoffs of Testing 

Good

1. **Detect Broken Software** - Tests provide signals when something is wrong
2. **Write Better Code** - Testing encourages better software architecture 
3. **Documentation** - Tests serve as executable documentation
4. **Enable Teamwork** - Tests facilitate safe collaboration and refactoring

Bad:

1. **Maintain More Code**
2. **Maintain More Code Execution Environments**

---

## Testing Well - Using `pytest`

story about engineers can make excel sing, marks, parameterization, fixtures, tmpdir, pytest-xdist (plugins), 

---

## Testing Well - Using Unit Tests Correctly

using unit tests for business/computational code, integration for plumbing code, tdd versus write once, test then write again

---

## Testing Well - Property Based Testing

property based testing with hypothesis

---

## Tests as Documentation

What questions do we want answered by documentation?

What answers can tests give you?

Tests as a scaffold
- team, documentation, code all hang off / rely on tests
- not really a scaffold then - more like a foundation, or clothes hanger

Code being tested tells you
- that we care about this code
- that this code might work

---

## Testing Documentation

phmdoctest

---

## Summary???

---

https://talks.kiwipycon.nz/kiwi-pycon-xiv-2025/submit/l8XKyL/info/

I am writing a talk on testing at Kiwi Pycon.

I can do either a 30 minute or 45 minute talk.

I have to write a submission

Abstract - A short description of your presentation that will be used in the conference programme. Please write at most 300 words.:

Description - A more detailed description of your presentation that, in addition to the abstract, will appear on the web site. This content will be shown publicly.

---

Have all the content written up on Data Science South as well

Can I just give the talk over the blog post - I think so!!!!

TODO
- put this into data-science-south

---

the other idea is `ci/cd on databricks`

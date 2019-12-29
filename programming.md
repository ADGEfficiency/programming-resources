> The cool thing about programming is that the principles are useful in real life - Hai (Data Science Retreat - Batch 19)

> Software is not a rapidly advancing technology. The rules of software are the same today as they were in 1946, when Alan Turing wrote the very first code that would execute in an electronic computer. The tools have changed, and the hardware has changed, but the essence of software remains the same. Software—the stuff of computer programs—is composed of sequence, selection, iteration, and indirection. Nothing more. Nothing less - Uncle Bob Martin - Clean Architecture: A Craftsman's Guide to Software Structure and Design 

## Simplicity

> That's been one of my mantras - focus and simplicity. Simpler can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it's worth it in the end because once you get there, you can move mountains - STEVE JOBS

> All problems have easy to understand, simple and wrong answers - RAYMOND HEITTIENGER

> One does not accumulate but eliminate. It is not daily increase but decrease. The height of cultivation always runs to simplicity - BRUCE LEE

KISS = keep it simple stupid
- businesses want simple solutions
- few dependencies
- easy to maintain, debug & put in production

YAGNI = you ain't gonna need it
- don't add features in before you know whether you need it

Premature specalization can hurt:
- increases co-ordination costs
- introduces wait times
- narrows context
- loss of accountability

Minimum viable products

Iterative code development

## Writing code

Who is code for
- readability (it's obvious to a new reader)
- maintainability (low cost in future developer time)
- testability (coverage)

Good design = easy to change
- code should be closed for modification but open to extension

- make it work
- make it right
- make it fast

## Abstraction

Machine code (binary) -> assembly -> C -> Python -> tensorflow -> keras

Abstraction = defining an object to carry out a task

Abstractions hide detail

In Python we don't need interfaces due to duck typing

## Encaspsulation

Simplifying behavior and hiding data

## Dependency



##What makes code good?

Length

Dependencies

Style

Functional decomposition

## Refactoring

> Refactor religiously - Jack Diederich

> The best writing is rewriting - E. B. WHITE

- programmer speak for iteration
- cycle of reorganizing and rewriting to improve readability & testability
- repeatedly reorganizing + rewriting
- great programmer spends half his time refactoring

Design is not just making short functions - **the real problem is writing code that mixes unrelated ideas**

Good software = well defined concepts & clear responsibilities

Useful strategies
- design patterns & SOLID for classes
- functional programming for pure functions with no side effects
- model-view-controller to separate storage & UI from business logic

Architecture
- should show the intent of a program
- not the frameworks

Best way to learn = write & study lots of programs

Less code is not always better
- I am now very eager to extend a function's body by a line or two if I can introduce more clarity to the code to help me and my teammates understand it.

[7 absolute truths I unlearned as junior developer](https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/)

Not all experience is created equal
- that’s why mentors are so important, and the team you work with is worth so much more than a couple bucks in your paycheck

Loads of companies and startups have little or no tests.
- no company has a perfect tech setup

Good enough is good enough

Documentation lies sometimes
- focus on automation over documentation where appropriate.


## Symptoms of bad code 

(rigid, fragile, not reusable)

Rigidity 
- when you touch the code you need to modify massive amounts of other code to come into consistency with this change
- coupling details

Spaghetti = coupling = dependency
- the bulk of software design = managing dependencies
- dependencies - which modules know about each other

Modules depend on each other / databases / code in undesirable ways

Most of programming is being able to 
- adapt examples to your problem
- use Google to find solutions to your error messages

## The readme

Write readme before the code

Readme is a pitch
- why this library exists
- what it solves
- to what extent

## from martin TODO refactor

Why do we write bad code? Because you need to go fast

You don’t go fast by rushing - go fast by doing a good job

Move deliberately rather than rushing - deliberate programming will be faster than rushed programming

Martin's 1st law of documentation - produce nothing unless it's need is immediate & significant

Software = sequence, selection, iteration and indirection

Kent Beck
1. make it work
2. make it right
3. make it fast

Fred Brooks - plan to throw one away

All paradigms remove capability from the programmer

### 1 - Structured programming

Limits direct transfer of control (ie no GOTO)

Allows functional decomposition

### 2 - OOP

Discipline on indirect transfer of control

Polymorphism allows source code dependency inversions
- dependencies don't depend on flow of control

OO
- encaspsulation, polymorphism, inheritance

C had encapsulation - C++ doesn't
C has perfect encapsulation - OO removes encapsulation for global/public/private args

In dynamic languages, you can have polymorphism without inhertiance - not necessary

Inheritance is used to inherit behaviour and variables

Encaspsulation, inheritance, polymorphism = OO = three magic words of OO


### 3 - Functional programming

Variables never changed
- immutable variables help with concurrency

Separate components that do versus do not mutate variables

Infinite data storage allows immutable variables
- this is how git works!
- no state, can generate state from history




Notice how well those three align with the three big concerns of architecture: function, separation of components, and data management.

## Working as a programmer

Idea that programming is full of young people (5, 10, 15 years halves the number of people) - this is one of his big ideas 🙂 (every 5 years population of programmers doubles)

Half of programmers have less than 5 years experience

Healthy dev teams = in control of their development environments

Control over computers, tools, databases etc

Devs should be able to do anything to their development machines

Must be safe for research - stuff that would be dangerous in production environment



## Further reading

[Applying the Gestalt Principles to your code](https://yetanotherchris.dev/clean-code/gestalt-principles/)

My notes:
- [Agile Data Science](https://github.com/ADGEfficiency/programming-resources/blob/master/agile-data-science.md)
- [Writing code](https://github.com/ADGEfficiency/programming-resources/blob/master/writing-code.md)
- [The Lean Startup](https://github.com/ADGEfficiency/programming-resources/blob/master/lean-startup.md)


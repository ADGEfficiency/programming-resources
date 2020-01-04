> The cool thing about programming is that the principles are useful in real life - HAI BUI

## Sequence, selection, iteration and indirection

> Software is not a rapidly advancing technology. The rules of software are the same today as they were in 1946, when Alan Turing wrote the very first code that would execute in an electronic computer. 

> The tools have changed, and the hardware has changed, but the essence of software remains the same. 

> Software—the stuff of computer programs—is composed of sequence, selection, iteration, and indirection. Nothing more. Nothing less - UNCLE BOB MARTIN 

Sequence = code runs in order

Selection = only running certain lines (i.e. using an `if` statement)

Iteration = looping (`for`, `while`)

Indirection = referencing by name, rather than by value (i.e. pointing to data via memory address)

## Abstraction

Functionality is exposed through an interface
- the implementation is hidden
- the detail is abstracted away

Abstractions hide detail
- closely related is the idea of encapsulation - simplifying behavior and hiding data

The opposite of abstract is concrete
- hard to change, dependent on a framework

Example of increasing abstraction:
- Machine code (binary) -> assembly -> C -> Python -> tensorflow -> keras

## Simplicity

> That's been one of my mantras - focus and simplicity. Simpler can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it's worth it in the end because once you get there, you can move mountains - STEVE JOBS

> All problems have easy to understand, simple and wrong answers - RAYMOND HEITTIENGER

> One does not accumulate but eliminate. It is not daily increase but decrease. The height of cultivation always runs to simplicity - BRUCE LEE

KISS = keep it simple stupid
- businesses want simple solutions
- few dependencies
- easy to maintain, debug & put in production

Complexity == bad!

Simple baselines are important in data science
- something that is easy to get working
- something to compare a more complex solution too

YAGNI = you ain't gonna need it
- don't add features in before you know whether you need it

Premature specalization can hurt
- increases co-ordination costs
- introduces wait times
- narrows context
- loss of accountability

## Programming

Most of programming is being able to 
- adapt examples to your problem
- know how to read the error messages you get
- using Google to find solutions to your error messages

Best way to learn = write & study lots of programs

Useful programming strategies (beyond the scope of this course)
- design patterns
- functional programming for pure functions with no side effects
- model-view-controller to separate storage & UI from business logic


## SOLID - [Wikipedia](https://en.wikipedia.org/wiki/SOLID)

Single responsibility principle
- A class should only have a single responsibility, that is, only changes to one part of the software's specification should be able to affect the specification of the class.

Open–closed principle
- open for extension, but closed for modification

Liskov substitution principle
- Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program

Interface segregation principle
- Many client-specific interfaces are better than one general-purpose interface

Dependency inversion principle
- depend upon abstractions, not concretions

Software architecture (beyond the scope of this course!)
- should show the intent of a program
- not the frameworks

## Working as a programmer

Half of programmers have less than 5 years experience

Healthy dev teams = in control of their development environments

Control over computers, tools, databases etc

Devs should be able to do anything to their development machines

Must be safe for research - stuff that would be dangerous in production environment

## Writing code

Good software = well defined concepts (abstractions!) & clear responsibilities

Design is not just making short functions 
- **the real problem is writing code that mixes unrelated ideas**

Less code is usually (but not always better)
- I am now very eager to extend a function's body by a line or two if I can introduce more clarity to the code to help me and my teammates understand it

Who is code for
- readability (it's obvious to a new reader)
- maintainability (low cost in future developer time)
- testability (coverage)

Good design = easy to change
- code should be closed for modification but open to extension

Kent Beck
1. make it work
2. make it right
3. make it fast

## What makes code good?

Readability
- style
- in Python this means PEP8

Length

Dependencies

Functional decomposition

## Symptoms of bad code 

Rigid, fragile, not reusable

Rigidity 
- when you touch the code you need to modify massive amounts of other code to come into consistency with this change
- coupling details

Spaghetti = coupling = dependency
- the bulk of software design = managing dependencies
- dependencies - which modules know about each other

Modules depend on each other / databases / code in undesirable ways

## Refactoring

> Refactor religiously - Jack Diederich

> The best writing is rewriting - E. B. WHITE

- programmer speak for iteration
- cycle of reorganizing and rewriting to improve readability & testability
- repeatedly reorganizing + rewriting
- great programmer spends half his time refactoring

Fred Brooks - plan to throw one away

## Documentation

Documentation lies sometimes
- focus on automation over documentation where appropriate.

Martin's 1st law of documentation 
- produce nothing unless it's need is immediate & significant

### The readme

Write readme before the code

Readme is a pitch
- why this library exists
- what it solves
- to what extent

## All paradigms remove capability from the programmer

Three align with the three big concerns of architecture: function, separation of components, and data management.

### 1 - Structured programming

Limits direct transfer of control (ie no `GOTO`)

Allows functional decomposition

### 2 - Object Oriented Programming

Discipline on indirect transfer of control

OOP
- encaspsulation = hiding details in a class (abstraction!)
- inheritance = class having subclasses (`Cat` & `Dog` class inherits from `Animal`)
- polymorphism = subclasses can override methods of the parent class

```python
class Animal:
    def eat(self): 
		  return 'still hungry'

class Dog(Animal):
    def eat(self): 
		  return 'full'
```

Duck typing
- an object's suitability is determined by the presence of certain methods and properties, rather than the type of the object itself
- 'If it walks like a duck and it quacks like a duck, then it must be a duck'

```python
obj.quack()
```

### 3 - Functional programming

Variables never changed
- immutable variables help with concurrency

Separate components that do versus do not mutate variables

Infinite data storage allows immutable variables
- this is how git works!
- no state, can generate state from history

## Further reading

[Applying the Gestalt Principles to your code](https://yetanotherchris.dev/clean-code/gestalt-principles/)

My notes:
- [Agile Data Science](https://github.com/ADGEfficiency/programming-resources/blob/master/agile-data-science.md)
- [Writing code](https://github.com/ADGEfficiency/programming-resources/blob/master/writing-code.md)
- [The Lean Startup](https://github.com/ADGEfficiency/programming-resources/blob/master/lean-startup.md)

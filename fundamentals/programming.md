# Programming

A collection of guidelines & advice on the [practice](#practice-of-programming), [principles](#principles-of-programming), [art](#art-of-programming) and [philosophy](#philosophies-of-programming) of programming.

![](assets/1907-Vlaminck-chatou-bridge.jpg)

*Die Brücke von Chatou - Maurice de Vlaminck - 1907*

clojure, swift, kotlin (modern java), julia, Go (no inheritance)

garbage collection

## Key takeaways

*For those in a rush*

Common mindsets of experienced developers
- why might this code need to change?
- what does this code depend on?
- who else will read this code?

Learn about
- abstractions, interfaces
- what KISS, YAGNI are
- why code is bad


# What is a program made of?

*Things that exist in computer programs*

> Software is not a rapidly advancing technology. The rules of software are the same today as they were in 1946, when Alan Turing wrote the very first code that would execute in an electronic computer - UNCLE BOB MARTIN

> The tools have changed, and the hardware has changed, but the essence of software remains the same - UNCLE BOB MARTIN

**Programming is communication** 
- a sequence of instructions for a computer

Who are we communicating with? Who is code for?
- computers
- other programmers (including your future self)

## What is a programming language?

```python
#  primitive data types
int, float, str

#  variables
answer = int(42)

#  data structures
[10, 20], {'a': 10, 'b': 20}

#  standard library
from collections import defaultdict
```

When do you know a language?

- syntax, conventions, code style
- standard libraries
- third party libraries
- tooling (package manager, profiler, debugger, logging)


## Why is programming hard

Non-stationary
- changing requirements
- changing tools, technologies

Tradeoffs
- technical debt
- programmer time versus computer time


## Sequence, selection, iteration and indirection

> Software—the stuff of computer programs—is composed of sequence, selection, iteration, and indirection. Nothing more. Nothing less - UNCLE BOB MARTIN 

- sequence = code runs in order
- selection = only running certain lines (logical execution of code, `if`, `and`)
- iteration = looping (`for`, `while`)
- indirection = referencing by name, rather than by value (pointing to data via memory address)

```python
def inspect(var):
    return f'id: {id(var)}, hex: {hex(id(var))}'

a = 10
b = a
c = 12

print(f'inspecting a', inspect(a))
print(f'inspecting b', inspect(b))
```

Some of the infomation that the program is dealing with
- identifiers of variable names (`a`, `b`, `c`)
- the variable types (both `int`)
- location in memory of the data
- the data (`10`, `12`)


## What is a program made of?

- primitive data types (`int`, `float`)
- variables
- data structures (`list`, `dict`)
- standard library
- third party libraries


## Infomation hiding

Let's take the Python dictionary - we can use it without knowing where data is stored in memory

```python
dataset = {'test': [10, 20, 30], 'train': [100, 200, 300, 400], 'name': 'fold1'}
```

Where data is stored in memory is a detail that is hidden
- an implementation detail that has been abstracted away from the programmer


## Abstraction

Concrete
- hard to change 
- dependent on a framework 
- dependent on an implementation directly

Abstract = the opposite of concrete
- moving away from the physical structure towards abstract structure
- move from the *how* to the *what* - user only needs to say what they want - not how! 
- user does need to care about how it works on the inside 

The most concrete form of a program is machine code
- sequences of bits that map to CPU instructions (`0010110` -> `ADD`)

Most programmers work at a much higher level of abstraction - a high level programming language

High level languages offer many advantages
- libraries (standard library, third party)
- portable to different CPU hardware
- abstractions

Abstraction
- hiding a implementation (abstract away complexity)
- lets programmers focus on the important details
- good abstractions don't just hide complexity - they can eliminate it
- keep stuff together that should be together (based on how & why it changes)

Let's take an example of neural networks, presenting abstractions that remove more and more detail:

```python
layer = [[Node('relu'), Node('relu')], [Node('sigmoid')]]

layers = [Dense('relu', nodes=2), Dense('sigmoid', nodes=1)]

network = Network(['dense', 'relu', 2], ['dense', 'sigmoid', 1])
```

Move towards the idea of hierarchy rather than physical structure

Law of leaky abstractions 
- all abstractions leak
- impossible to abstract perfectly - because all abstractions are lies
- sometimes leaks are necessary (because they are useful)


## Interfaces

An abstraction hides detail by exposing only a simple interface to the programmer
- we want narrow, minimal interfaces with deep functionality

An interface is the total cost of the system to the user
- everything they need to think about
- dependencies

A good interface makes the common case simple
- sensible defaults

Well defined systems have **good interfaces**.  Interface where one part of the system doesn't care about other parts of the system.

*Further reading*
- [Abstraction - Wikipedia](https://en.wikipedia.org/wiki/Abstraction_(computer_science))


## API

Closely related to interfaces
- not talking about REST API's (which is more concrete that a general API)

API
- user interface
- CLI, REST, UI, GUI

Who will use the API?

Good API = makes it easy to develop a solution by providing building blocks to be put together by the programmer

Balance between simplicity (90%) and flexibility (10%)
- focus on 90% of use cases
- simplicity
- flexibility
- consistency
- safety

Configurability is the root of all evil
- adding configuration options = program was too stupid to figure out what is best for user
- subjective configuration (ie colorscheme) only

*Further reading*
- [python.apichecklist.com](http://python.apichecklist.com)
- How to make a good library API PyCon 2017 - [video](https://www.youtube.com/watch?v=4mkFfce46zE)
- keras-team/governance/keras_api_design_guidelines.md - [text](https://github.com/keras-team/governance/blob/master/keras_api_design_guidelines.md)
- Amjith Ramanujam Awesome Command Line Tools PyCon 2017 - [video](https://www.youtube.com/watch?v=hJhZhLg3obk&t=1321s)


## Documentation

Documentation lies sometimes
- focus on automation over documentation where appropriate.

Uncle Bob Martin's 1st law of documentation - produce nothing unless it's need is immediate & significant


### Comments

Can be useful
- can also be wrong
- should describe things that aren't obvious from the code

Needing comments can suggest poorly written code
- variable & function names aren't useful
- no functional decomposition
- want code that explains itself
- fallacy that people whose code is not readable will be able to write comments
- if you cant express yourself in code, you won’t be able to in comments

Comments are a source of noise in code
1. if code is clear, speaks for itself
2. comments are not checked by compiler
3. comments clutter code

Hard to give firm guidelines on comments - easier to examples of how not to use them:

```python
#  define variable sales
sales = 500

# def add_profit(sales):
#     "Adds percentage profit"
#     return sales * (1 + profit)

def add_profit(sales, profit):
    "Adds percentage profit"
    return sales + profit
```

Takeaway - find out for yourself what your theory on comments is


### The readme

Write readme before the code
- write the API / interface before the code

Readme is a pitch
- why this library exists
- what it solves
- to what extent

Write sample code for the most common use cases
- readme driven design


## Testing

[teaching-monolith/test-driven-development](https://github.com/ADGEfficiency/teaching-monolith/tree/master/test-driven-development)

- a form of documentation

- use assert statements - they are low overhead and tells reader what is going to happen

Focus unit tests on code that is touched a lot / is important

Unchohesive tests - tests should express functionality of the code to the reader

Organize tests as scenarios that use multiple parts of the cod


## Logging

Human only, machine & human, machine only (instrumentation)


# Practice of programming

*What programmers actually spend their time doing*

> Taking examples and adapting them to your needs is a skill fundamental not just to visualization, but to all data science and programming in general. 
> Nobody knows everything, and the job involves a lot of figuring things out - RUSSELL JURNEY (Agile Data Science)

Most time is spent
- adapting examples (stealing code)
- getting dependencies to work
- using Google to find solutions to error messages

Best way to learn
- write programs
- read other peoples programs (open source is amazing for this)

Control over your development environment
- being able to use the operating system of your choice at work
- being able to manage Python effectively on a remote machine
- being able to do things that would be dangerous in production


## What beginners get wrong

Not understanding how a computer works

Not understanding how your language works
- how data structures are implemented
- how data is copied (or not)
- how is memory managed



## What gets better

- if something breaks - look at what you just changed
- how to notice when you've done down the wrong path, and how to work backwards from there
- anticipating problems
- know what simple code looks like
- recognize when your code is too complex
- refactor, rename, encapsulating
- prevent opportunities to be inconsistent (big message)

Seeing unrelated ideas mixed together
- using different libraries in the same function

Seeing / feeling / fearing dependencies

Seeing / feeling / fearing scope (project scope especially)


## Constant debugging

Programming is a never ending process of fixing errors

Coding is constant problem solving

## Iterative

No one gets a program correct the first time
- implement new ideas in parallel with the old ones, rather than mutating the existing code
- easy to switch out implementations if the idea is expressed as a pure function
- internal state / multiple entry points = harder

Kent Beck
1. make it work
2. make it right
3. make it fast

## Refactoring

> Refactor religiously - Jack Diederich

> The best writing is rewriting - E. B. WHITE

- programmer speak for iteration
- cycle of reorganizing and rewriting to improve readability & testability
- repeatedly reorganizing + rewriting
- great programmer spends half his time refactoring

Refactoring has degrees to it
1. just copy paste functions from notebook into scripts, and fix any errors that refer to global vars slipping into functions but not through args
2. actually changing the functionality of the functions - this is MUCH MORE INVOLVED and much riskier (because you don’t know if your changes are working correctly!). 

A test suite is crucial to effective refactoring
- can run your test suite as you refactor, to check if you broke anything

*Further reading*
- Brett Slatkin - Refactoring Python: Why and how to restructure your code - PyCon 2016 - [youtube](https://www.youtube.com/watch?v=D_6ybDcU5gc&feature=player_embedded)


## Code reviews

Involve collaborators

- most often people include others too late
- possibility to make bad choices early on
- difficulty of doing a review of 5,000 lines of code
- people want to be involved if they can make a mark/a direction

Code review forces more than one person to be involved in a project


# Principles of programming

*Ideas, heuristics & mental models*

Mindsets of experienced programmers:
- why does this code need to change?
- who needs to read it?
- is this code tested?


## Zen of Python 

Try the following in your shell:

```bash
$ python -c "import this"
```
```
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
```

A key idea in the Zen of Python is to prefer easy things:

* simple better than complex
* flat is better than nested
* readability counts
* if the implementation is hard to explain, its a bad idea
* if the implementation is easy to explain, is might be a good idea


## Simplicity

> That's been one of my mantras - focus and simplicity. Simpler can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it's worth it in the end because once you get there, you can move mountains - STEVE JOBS

> All problems have easy to understand, simple and wrong answers - RAYMOND HEITTIENGER

> One does not accumulate but eliminate. It is not daily increase but decrease. The height of cultivation always runs to simplicity - BRUCE LEE

> Taste applies to code, too. Taste is a constraint-satisfaction process regularized by a desire for simplicity. Keep a bias toward simplicity - François Chollet

Why is simplicity such a common message in programming?
- how easy it is to do complicated things with computers
- intuition that more complex / newer tech / newer tool is better

Simplicity Paradox
- everything that can make code simpler can make it more complex
- there are no simple rules to write simple code

There are no simple answers - we will never have general answers to simple questions 
- how long should this function be
- what is a good variable name

But when you do make things simple:

> I thought this was a hard problem?

> Is that all you did?

Simple baselines & models are important in data science
- something that is easy to get working
- something to compare a more complex solution too

*Further reading*
- Simplicity: Not Just For Beginners (or How To Write Simpler Code) - [video](https://youtu.be/W2Thd9nKqmU)
- John Ousterhout - A Philosophy of Software Design - [video](https://www.youtube.com/watch?v=bmSAYlu0NcY)

## Common software engineering maxims

**KISS = keep it simple stupid**
- businesses want simple solutions
- few dependencies
- easy to maintain, debug & put in production

**YAGNI = you ain't gonna need it**
- don't add features in before you know whether you need it


## Don't write code you don't need

Use other peoples code
- well tested standard library
- likely someone has faced & solved the problem you are facing

Don't build flexibility you don't need
- that you don't use
- (big difference between the two - you can always convince that you'll need something)
- don't build flexibility before you need it

Premature specalization can hurt
- increases co-ordination costs
- introduces wait times
- narrows context
- loss of accountability

Simplicity versus performance
- does this choice actually occur that much?


## Specialization

> I find that for research work, and when trying to solve difficult environments, specific custom modifications are usually required - [David Ha](http://blog.otoro.net/2018/06/09/world-models-experiments/)

- simplifies the code 
- generalization makes code bases hard (trying to do everything - AKA YAGNI)

There is a place for writing code based that aren't simple & do too much
- learning
- build your own keras -> understand

- use conventions & patterns & libraries that others will recognize

The most successful computing systems (C + UNIX) are made of small, specalized tools
- generalizaion & power from modular composition of narrow tools


## Dependency

The bulk of software design = managing dependencies

Dependencies - which modules know about each other

You won't always be on the bleeding edge
- don't want to use the latest version of anything
- bugs, compatability with other libraries

Others peoples code is a liability - all code is a liability
- if you can solve a problem without code, do it!


## Portability

Best tools are easily available

Minimize setup cost


## Maintainability

Magic numbers

```python
result = 36 * data
```

The computer is a machine, but a codebase is an organism.

Risk factors
- time since last refactor
- how often code is being meaningfully executed

Successful management of a codebase consists in defending its long-term health against the dangers of decay and opportunistic growth.

The organic, evolutionary nature of code also highlights the importance of getting your APIs right. By virtue of their public visibility, APIs can exert a lot of influence on the future growth of the codebase. A good API acts like a trellis, coaxing the code to grow where you want it. A bad API is like a cancer, and it will metastasize all over your codebase. Some quick examples:

*Further reading:*
- [A Codebase is an Organism](https://meltingasphalt.com/a-codebase-is-an-organism/)
- [LEGO blocks and organ transplants](https://www.johndcook.com/blog/2011/02/03/lego-blocks-and-organ-transplants/)



### [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)

**Single responsibility principle**

> A class should only have a single responsibility, that is, only changes to one part of the software's specification should be able to affect the specification of the class.

Separation of concerns & responsibility
- don't mix unrelated ideas
- don't mix code that changes for different reasons

**Open–closed principle**

> open for extension, but closed for modification

Behaviour is changed by adding code - not changing existing code

**Liskov substitution principle**

> Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program

**Interface segregation principle**

> Many client-specific interfaces are better than one general-purpose interface

**Dependency inversion principle**

> depend upon abstractions, not concretions


*Further reading*
- SOLID principles of object objected and agile design - [youtube](https://www.youtube.com/watch?v=TMuno5RZNeE)


# Art of programming

*What makes a program good*


## Features of good programs

Good software = well defined concepts & clear responsibilities

- readability (it's obvious to a new reader)
- maintainability (low cost in future developer time)
- testability (coverage)
- short
- few dependencies
- easy to change - code should be closed for modification but open to extension
- fast to write
- more correct
- runs faster / less memory
- easier to read
- easier to modify
- more fun to create

Design is not just making short functions 
- the real problem is writing code that mixes unrelated ideas

Simple code
- expressive
- readable
- understandable
- unsuprising
- transparent
- self-explanatory
- reassuring
- pleasant

Some technical debt is OK
- Bad code isn’t bad code because it’s written badly; it’s bad code if it slows you down, causes bugs for users, or constantly breaks. That’s the code you need to fix.

Software architecture 
- should show the intent of a program
- not the frameworks


## Features of bad code

- rigid
- fragile 
- not usable
- not reusable

Rigidity 
- when you touch the code you need to modify massive amounts of other code to come into consistency with this change
- coupling details

Spaghetti = coupling = dependency
- the bulk of software design = managing dependencies
- dependencies - which modules know about each other

Modules depend on each other / databases / code in undesirable ways


## Readability

> Readable code is not a nice-to-have, it is a fundamental part of what writing code is about. This involves factoring code clearly, picking self-explanatory variable names, and inserting comments to describe anything that’s implicit. - François Chollet 

Code style
- doesn't matter to beginners, very important for experienced developers
- best way to learn is syntax highlighting & inline linting

Length
- as long as it needs to be
- reader should be able to figure out in a minute what a function does


## Length 

Less code is usually (but not always better)
- I am now very eager to extend a function's body by a line or two if I can introduce more clarity to the code to help me and my teammates understand it

Code is a liability

Less code is not always better
- I am now very eager to extend a function’s body by a line or two if I can introduce more clarity to the code to help me and my teammates understand it.

## Writing tips


### Naming variables

Closely related to abstraction
- underabstraction - not putting enough detail into names

Diluting meaning of variables by adding names together

`list_of_articles` vs `articles`
- don't need the data structure type in the variable name
- use the plural if you have it


### Writing functions

Functions allow
- code reuse
- testing

Functions are about WHAT - what does the function do
- function should go on as long as it has too
- return early if possible
- define things where you use them 

Short functions
- so they can be named
- if a function does two things, maybe it is two functions?
- one function with default parameters (versus two functions)

Avoid long lists of parameters
- don't pass three strings & a float, pass an Order & Employee
- if your function takes lots of arguments, maybe it should be more than one function


```python
TODO
```
- All effort is not useful effort - but all effort feels like useful effort

We can break a function down into three stages 

Input:
- don't get what you don't need
- sensible defaults
- early errors are good errors (ie input checks)
- asserts add information

Transform:
- should be boring
- exceptions should be exceptional

Output:
- pretty print results
- executions should be really surprising
- format info the way caller expects
- return once = form old compilers (no longer true) = use as many returns as you need
- returning early adds confidence - return early when you can


### Writing classes

Use class with bundle of mutable data and bunch of related functions
- if you have two methods - one being init - it shouldn’t be a class!

If you use class once and throw it away, it could be a lot simpler
- often want mulitple instances to get benefit of reuse

Don't overdo inheritance
- single level will solve many problems

Derived class should be usable through the base class interface, without user needing to know the difference

Classes represent real things - but they aren’t those real things!

Representatives of things don’t share the relationships of the things they represent

*Further reading:
- Jack Diederich - HOWTO Write a Function - [youtube](https://www.youtube.com/watch?v=rrBJVMyD-Gs)
- Jack Diederich - Stop Writing Classes - [video](https://www.youtube.com/watch?v=o9pEzgHorH0)




## Functional programming


## Design patterns


### MVC

- model-view-controller to separate storage & UI from business logic


### Clean architecture



# Philosophies of programming

## [Agile software development](https://en.wikipedia.org/wiki/Agile_software_development)

Agile software development values:
- Individuals and interactions over processes and tools
- Working software over comprehensive documentation
- Customer collaboration over contract negotiation
- Responding to change over following a plan 

Manifesto for Agile Software Development:
- Customer satisfaction by early and continuous delivery of valuable software.
- Welcome changing requirements, even in late development.
- Deliver working software frequently (weeks rather than months)
- Close, daily cooperation between business people and developers
- Projects are built around motivated individuals, who should be trusted
- Face-to-face conversation is the best form of communication (co-location)
- Working software is the primary measure of progress
- Sustainable development, able to maintain a constant pace
- Continuous attention to technical excellence and good design
- Simplicity—the art of maximizing the amount of work not done—is essential
- Best architectures, requirements, and designs emerge from self-organizing teams
- Regularly, the team reflects on how to become more effective, and adjusts accordingly


## [Clean Architecture]()


*Further reading*
- The Principles of Clean Architecture - [youtube](https://www.youtube.com/watch?v=o_TH-Y78tt4)


## [Literate programming](https://en.wikipedia.org/wiki/Literate_programming)

Literate programming = liked by people that like both programming and writing
- the Jupyter Notebook is an example of literate programming
- The literate programming paradigm, as conceived by Knuth, represents a move away from writing programs in the manner and order imposed by the computer, and instead enables programmers to develop programs in the order demanded by the logic and flow of their thoughts.
- Literate programming (LP) tools are used to obtain two representations from a literate source file: one suitable for further compilation or execution by a computer, the "tangled" code, and another for viewing as formatted documentation, which is said to be "woven" from the literate source.[3] While the first generation of literate programming tools were computer language-specific, the later ones are language-agnostic and exist above the programming languages.



## [Test driven development](https://en.wikipedia.org/wiki/Test-driven_development)

1. write test
2. check the test fails
3. write the program until test passes
4. refactor

10 simple rules for writing great testcases by Steve Poole and Stuart Marks - [video](https://www.youtube.com/watch?v=n6Nde8TgB2Y)


## [Waterfall](https://en.wikipedia.org/wiki/Waterfall_model)

Linear, sequential development
- seen as what not to do


# References

[5 Things I’ve Learned in 20 Years of Programming](https://daedtech.com/5-things-ive-learned-in-20-years-of-programming/)

Greg Ward - How to Write Reusable Code - PyCon 2015 - [video](https://www.youtube.com/watch?v=r9cnHO15YgU)

How to write a production-level code in Data Science? - [article](https://towardsdatascience.com/how-to-write-a-production-level-code-in-data-science-5d87bd75ced)

Kevlin Henney - Seven Ineffective Coding Habits of Many Programmers - [youtube](https://www.youtube.com/watch?v=ZsHMHukIlJY&feature=youtu.be)

Notes to Myself on Software Engineering - François Chollet - [blog-post](https://medium.com/s/story/notes-to-myself-on-software-engineering-c890f16f4e4d)

Kevlin Henney – Clean Coders hate when you use these programming tricks - [youtube](https://www.youtube.com/watch?v=ZsHMHukIlJY&feature=youtu.be)

[The Skills Poor Programmers Lack - Justin Meiners](https://justinmeiners.github.io/the-skills-programmers-lack/)

[Things I was wrong about when I started programming](https://javascriptplayground.com/things-i-was-wrong-about-javascript/)

All Questions Answered - Donald Knuth - [youtube](https://www.youtube.com/watch?v=xLBvCB2kr4Q)

# Further reading

[Applying the Gestalt Principles to your code](https://yetanotherchris.dev/clean-code/gestalt-principles/)

The Gestalt principles concern themselves with how we visually perceive groups of objects

(the) principles exist because the mind has an innate disposition to perceive patterns in the stimulus based on certain rules. These principles are organized into five categories: Proximity, Similarity, Continuity, Closure, and Connectedness.

1. Similarity - group variables together
2. Good form - if you have a well formed object you won’t notice the parts it’s made up of
3. Proximity - the space between objects (close to similarity) -
4. Closure - group formed if they appear to form a whole
5. Continuation - intersection of two objects appears to the eye as one single object

[Learn more programming languages, even if you won't use them](https://thorstenball.com/blog/2019/04/09/learn-more-programming-languages/)

Teach Yourself Programming in Ten Years - [blog post](http://norvig.com/21-days.html)


Notes on "A Philosophy of Software Design." - [blog post](https://lethain.com//notes-philosophy-software-design/)

Hints for Computer System Design - [paper](https://s3.amazonaws.com/systemsandpapers/papers/acrobat-17.pdf)

Clear is better than clever - [slides](https://dave.cheney.net/paste/clear-is-better-than-clever.pdf)

No Silver Bullet – Essence and Accident in Software Engineering - [paper](http://worrydream.com/refs/Brooks-NoSilverBullet.pdf)

[Think in Math. Write in Code. - Justin Meiners](https://justinmeiners.github.io/think-in-math/)

[Building Awesome Developer Tools - Ines Montani](https://youtu.be/Ivb4AAuj5JY)

[Linux kernel coding style](https://www.kernel.org/doc/Documentation/process/coding-style.rst)

[Things I Learnt The Hard Way (in 30 Years of Software Development)](https://blog.juliobiason.net/thoughts/things-i-learnt-the-hard-way/)

[3 Kinds of Good Tech Debt - Jon Thornton - Squarespace](https://engineering.squarespace.com/blog/2019/three-kinds-of-good-tech-debt)

[7 Skills of Highly Effective Programmers](https://medium.com/better-programming/7-habits-of-highly-effective-programmers-563ee3b63f33)

[Design Patterns in Dynamic Programming - Peter Norvig](http://norvig.com/design-patterns/design-patterns.pdf)

Pythonic Guide to Logging - [blog post](https://timber.io/blog/the-pythonic-guide-to-logging/)


https://medium.com/@samsniderheld/how-i-taught-a-machine-to-take-my-job-2dd1adb4df18

Continuous Integration for Machine Learning - [blog post](https://medium.com/@rstojnic/continuous-integration-for-machine-learning-6893aa867002)

Web Architecture 101 - [blog post](https://engineering.videoblocks.com/web-architecture-101-a3224e126947

[hellerve/programming-talks](https://github.com/hellerve/programming-talks)

spaCy
- [Matthew Honnibal & Ines Montani: spaCy and Explosion: past, present & future](https://youtu.be/Jk9y17lvltY)
- [Ines Montani: Python India Keynote](https://www.youtube.com/watch?v=Ivb4AAuj5JY)

Robert (Uncle Bob) Martin
- The Scribe's Oath - [youtube](https://www.youtube.com/watch?v=X31Jc6HQUcs)
- Craftsmen - Control Your Environment - [youtube](https://www.youtube.com/watch?v=NZNhtYVb6H8)

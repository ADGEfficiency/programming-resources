# Programming

*The practice, principles, art and philosophies of programming*

- [what is a program](#what-is-a-program) - *what are programs made of* - abstractions & interfaces, documentation, testing, properties of languages, OOP & functional programming, language landscape
- [practice of programming](#practice-of-programming) - *what programmers do* - read code, googling for error messages, debugging, refactoring
- [principles of programming](#principles-of-programming) - *laws, mindsets and rules* - simplicity, KISS, YAGNI, DRY, maintainability, 
- [art of programming](#art-of-programming) - *what makes a program good* - simplicity, readability, names, functions, classes
- [philosophy of programming](#philosophies-of-programming) - *coherent collections of all the above* - agile, literate programming, TDD, clean code

![](assets/1907-Vlaminck-chatou-bridge.jpg)

*Die Brücke von Château - Maurice de Vlaminck - 1907*


# Key takeaways

*For those in a rush*

Common mindsets of experienced developers
- why might this code need to change?
- what does this code depend on?
- who else will read this code?

This course will teach you
- what is an abstraction
- what KISS, YAGNI, DRY are
- why code is bad


# What is a program?

*What is a computer program made of?*

> Software is not a rapidly advancing technology. The rules of software are the same today as they were in 1946, when Alan Turing wrote the very first code that would execute in an electronic computer - UNCLE BOB MARTIN

> The tools have changed, and the hardware has changed, but the essence of software remains the same - UNCLE BOB MARTIN

**Programming is communication** - we are communicating **a sequence of instructions**

Who are we communicating with? Who is this code for?
- computers
- other programmers (including your future self)


## What is program made of?

```python
#  primitive data types
int, float, str

#  variables
answer = int(42)

#  data structures
[10, 20], {'a': 10, 'b': 20}

#  libraries
from collections import defaultdict
```


## When do you know a language?

**Knowing a language is much more than knowing how to write a program**

- syntax, conventions, code style
- standard libraries
- third party libraries
- tooling (package manager, profiler, debugger, logging)


## Why is programming hard

> Give the same complex problem to two modern programmers and you will , I claim , get two rather different programs . Hence my belief that current programming practice is closer to novel writing than it is to engineering - RICHARD HAMMING

Non-stationary environment
- changing requirements
- changing tools, technologies

Tradeoffs
- programmer time versus computer time
- technical debt is a tradeoff
- library A versus library B


## Why is programming easy

Freely shared tools & knowledge (and maybe data)

Instant feedback (error messages)

Tooling always getting better


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

Some of the information that the program is dealing with
- identifiers of variable names (`a`, `b`, `c`)
- the variable types (both `int`)
- location in memory of the data
- the data (`10`, `12`)


## Information hiding

Let's take the Python dictionary - we can use it without knowing where data is stored in memory

```python
dataset = {'test': [10, 20, 30], 'train': [100, 200, 300, 400], 'name': 'fold1'}
```

- where data is stored in memory is a detail that is hidden
- **an implementation detail that has been abstracted away**
- abstracting away this implementation detail gives us less control, but makes it simpler to write


## Abstraction

To understand abstraction, let's first consider it's opposite - being concrete


### What is concrete?

Something that is concrete is:
- hard to change
- dependent on a framework
- dependent on an implementation directly

**The most concrete form of a program is machine code**
- sequences of bits that map to CPU instructions (`0010110` -> `ADD`)
- changing these requires changing hardware (your CPU)


### What is abstract?

**Abstract = the opposite of concrete**
- moving away from the physical structure towards abstract structure
- move from the *how* to the *what* - user only needs to say what they want - not how!
- user does need to care about how it works on the inside - lets programmers focus on the important details
- hiding a implementation (abstract away complexity)
- move towards the idea of hierarchy rather than physical structure (i.e. inheritance)
- erases differences, to focus on the commonalities that matter

Good abstractions can allow good code
- objects that map meaningfully to real world business problems (i.e. a `Customer` class)
- keep stuff together that should be together (based on how & why it changes)
- **good abstractions don't just hide complexity - they can eliminate it**

Most programmers work at a much higher level of abstraction than machine code - using a high level programming language.  High level languages offer many advantages (one of which is abstractions):
- libraries (standard library, third party)
- portable to different CPU hardware architectures
- reusable, optimized, tested abstractions

Let's look at some examples of different levels of abstraction when modelling neural networks:

```python
#  TENSORFLOW 1
a = tf.constant(5.0)
b = tf.constant(6.0)
c = a * b

with tf.Session() as sess:
  print(sess.run(c))

#  TENSORFLOW 2
a = 5.0
b = 6.0
c = tf.add(a, b)
```

Abstractions are never perfect
- **Law of leaky abstractions**
- all abstractions leak
- impossible to abstract perfectly - because all abstractions are lies 
- they are approximations - the map, not the territory

*Further reading*
- [Abstraction - Wikipedia](https://en.wikipedia.org/wiki/Abstraction_(computer_science))
- [Pierce the Abstraction Wall](https://www.nemil.com/on-software-engineering/pierce-the-abstraction-wall.html) - soft versus hard interfaces

## Interfaces

An interface is
- what the use interacts with
- how we actually use something

**An interface is the total cost of the system to the user**
- everything they need to think about
- dependencies

What do we want in a good interface?
- narrow, minimal interfaces with deep functionality
- familiarity (works like other tools)
- allows isolation & communication

**Good abstractions allow good interfaces**
- hides detail by exposing only a simple interface to the programmer

A good interface makes the common case simple
- sensible defaults




### API

API = Application programming interface
- a specific example is REST API's (which is more concrete that the general API idea)
- a user interface
- can be CLI, REST, UI, GUI

**Who will use the API?**
- data scientists
- third party developers
- customer

A good API provides building blocks to be put together by the programmer

Balance between simplicity (90%) and flexibility (10%)
- focus on 90% of use cases
- also need to consider consistency and safety

Configurability is the root of all evil
- adding configuration options = program was too stupid to figure out what is best for user
- subjective configuration (ie colorscheme) only

Symmetry in API's

- upload & download
- create & delete
- allows chainable operations - what comes out can be put directly into the next operation

If you users are writing loops, these are things you can do internally in your API

API's that are convenient for your users can require lots more work on your part!

*Further reading*

- [How to Write Python Code Others Like to Use - Anna Tisch - Kiwi Pycon X](https://youtu.be/xZSGo4vM-ok)
- [python.apichecklist.com](http://python.apichecklist.com)
- [keras-team/governance/keras_api_design_guidelines.md](https://github.com/keras-team/governance/blob/master/keras_api_design_guidelines.md)
- [Notes to Myself on Software Engineering - François Chollet](https://medium.com/s/story/notes-to-myself-on-software-engineering-c890f16f4e4d)

*Further watching*

- [Amjith Ramanujam Awesome Command Line Tools PyCon 2017](https://www.youtube.com/watch?v=hJhZhLg3obk&t=1321s)
- [How to make a good library API PyCon 2017](https://www.youtube.com/watch?v=4mkFfce46zE)


## Documentation

What is documentation in software?
- content that explains how software works, how to use it
- often not executable

Examples
- inline comments (docstrings)
- `README.md`
- Jupyter Notebook tutorials
- Sphinx style generated documentation

**The key problem with documentation is the possibility of inconsistency**:
- documentation lies sometimes

Take the example below:

```python
def calculate_absolute_change(x, y):
    return abs(x - y)

#  calculate percentage change in profit
calculate_absolute_change()
```

Uncle Bob Martin's 1st law of documentation 

- produce no documentation unless it's need is immediate & significant

*Further reading*

- [The documentation system](https://documentation.divio.com/) - there isn’t one thing called documentation, there are four.
- [Diátaxis - A systematic framework for technical documentation authoring](https://diataxis.fr/) - four modes of documentation - tutorials, how-to guides, technical reference and explanation.


### Comments

Can be useful
- can also be wrong
- **should describe things that aren't obvious from the code**
- comments & docstrings should describe the why - the code already describes the how

Needing comments can suggest poorly written code
- variable & function names aren't useful
- no functional decomposition
- want code that explains itself
- fallacy that people whose code is not readable will be able to write comments
- if you can't express yourself in code, you won’t be able to in comments

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


### README

A special text file
- most users of your software will read it
- it's also visible to recruiters (even non-technical)
- it may be the only thing people read

**The README is a pitch**
- what is this library
- why this library exists
- what problem it solves
- how to use it

A README should be as short as possible
- detailed documentation can do in a docs site (see Sphinx or MkDocs)

Key elements
- name
- badges - don't use too many
- one-liner - describe what the library dose
- usage 
  - example code should be included as a file in your repo as well
  - CLI examples should show commands and output
- API
- Roadmap showing important files & subdirectories
- Installation
- License

README driven development 
- write README before the code
- write the API / interface before the code
- write the tutorial before the code
- write sample code for the most common use cases

*Further reading*

- [README Driven Development](https://tom.preston-werner.com/2010/08/23/readme-driven-development.html),
- [Write documentation first. Then build.](https://reproof.app/blog/document-first-then-build).
- [Art of README](https://github.com/hackergrrl/art-of-readme) - [HN Discussion](https://news.ycombinator.com/item?id=32343443)


## Testing

**Testing is an executable form of documentation**
- tests can express functionality of the code to the reader
- also a check for program correctness (or rather, lack of incorrectness - you can't check if a program is correct :)

Examples
- use inline assert statements (`assert train.shape[0] < test.shape[0]`) - they are low overhead and tells reader what has to happen
- unit tests
- integration tests
- system tests 

**Focus tests on code that is touched a lot / is important / changes a lot**
- organize tests as scenarios that use multiple parts of the code

*Further reading*
- [teaching-monolith/test-driven-development](https://github.com/ADGEfficiency/teaching-monolith/tree/master/test-driven-development)


## Logging

Data generated by a program in execution

Human only, machine & human, machine only (instrumentation)

A log file
- append only
- sequence of records
- ordered by time

Records

- what happened 
- when it happened

You should log after events, not before:

```python
#  not this
print('doing thing')
do_thing()

#  do this
do_thing()
print('thing is done')
```

Separate parameters from the message:

```python
#  do this
inp = 'some-input'
do_thing(inp)
print(f'did thing [inp: {inp}]')
```

Distinguish between warning, error and info:

- info for business,
- debug for technology,


*Further reading*

- [The Log: What every software engineer should know about real-time data's unifying abstraction](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)
- [My Logging Best Practices - Thomas in Coding](https://tuhrig.de/my-logging-best-practices/) - [HN discussion](https://news.ycombinator.com/item?id=28759492)


## Properties of programming languages

> Languages shape the way we think, each in their own peculiar way. That’s true for programming languages as well. Each language contains a different mental model, a different perspective for thinking about computation and how to write programs - THORSTEN BALL

*Attributes, components & patterns that make languages similar and different*


## High versus low level languages

How close to the metal (hardware) you are
- the lowest level = machine code (binary)
- next is assembly
- then languages like C

## Speed

### Computer time versus programmer time

**Classic tradeoff between how fast a program is versus how hard a language is to us**
- computer time has become cheaper
- programmer time is as valuable as ever

Some things can't be sped up by any language
- can't speed up I/O

Compiled languages are fast to run
- often difficult to write (static typing etc)


### Things that speed up the execution of a program

- tell the compiler as much as possible (static typing)
- manage memory by hand (not automatically)
- compilation to binary


### Things that slow down the execution of a program

- dynamic typing
- automatic memory management
- interpretation


## Typing 

### Types & type inference

Most languages offer primitive data structures (strings, floats, integers) and more complex types (often user defined). Knowing the type of a variable is crucial to knowing what we can do with it - **this is type inference**

Object oriented languages give programmers the ability to create their own types
- for example classes
- this is what C++ gave C

- When you detect type errors (before or after running code)
- How useful the tooling for your language can be

Types are useful for compiler and for tooling
- type hints in your editor


### Static versus dynamic typing

Static typing
- **declared the type of a variable before runtime**
- helps prevent bugs
- helps compilers to generate fast code
- restricts what kind of programs you can write

```python
msg: str = 'Hello World'
```

Dynamic typing
- not declaring types
- types checked at runtime
- slower
- more flexible

```python
msg = 'Hello World'
```

Dynamically typed languages can't be optimize in the same way as static - but that doesn't mean their aren't ways to optimise then
- slow versus hard to optimize

Allocations (i.e. of memory) and copies make things slow


### Strong versus weak typing

No precise technical definition
- measurement of the 'strength' of the type system

Strong typing
- stronger = stricter
- checks happen at compile time - errors caught before code is run

Weak typing
- type checking at runtime - meaning errors cause crashes
- errors from automatic type conversion

[Strong and weak typing - Wiki](https://en.wikipedia.org/wiki/Strong_and_weak_typing)


## Memory management

Why is it important to manage memory
- you only have a limited amount
- memory leak = not freeing heap memory after it isn't being used

Manual memory management = lowest level
- manually allocate & assign data to memory

Garbage collection
- automatically managed memory
- based on reference counting
- this is what Python does
- but still can have leaks (global vars etc)

Multithreaded code gives the potential for race conditions
- separate threads changing the same variable (inmemory)
- multiprocessing (where each process has a separate memory) avoids this possibility


## Portability

Portability = using code on different platforms
- different operating systems, different CPU architectures

Four issues make this hard:
- CPU instruction sets (fix by not using assembly)
- system calls (fix using interfaces)
- capabilities (hardware)
- libraries

Assembly is not portable

High level languages are portable
- compile to a target instruction set


## Size of community

Maturity of language
- how long will it be supported
- availability of libraries & tooling
- availability of employees, jobs & colleagues


## How functional is the language?

**Functional programming = not changing / relying on state**
- variables that don't vary (immutable data)
- first class functions (no objects - aka no state)
- no side effects

Why is functional programming good?
- idempotentcy - function always returns the same thing, whenever it runs
- not affected by, or affects, the outside world

But the entire value of programs is that they do modify state!
- true functional programming is an unreachable idea
- functional programming is about isolating where you rely upon & impact the outside world

Useful ideas
- separate components that do versus do not mutate variables
- easy to switch out implementations if the idea is expressed as a pure function
- internal state / multiple entry points = harder to work with

*Further reading*
- [teaching-monolith/distributed-computing/functional-programming.ipynb ](https://github.com/ADGEfficiency/teaching-monolith/blob/master/distributed-computing/functional-programming.ipynb)


## How object oriented is the language?

**Object Oriented Programming (OOP) = using objects**
- objects (`class`) that contain data & functionality
- OOP = grouping data (class attributes in Python) and function (class methods in Python)

Fundamental paradigms in OOP
- abstraction = hiding implementation complexity
- encapsulation = using classes to combine data & function (can also be to protect data access via getters & setters)
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
- 'If it walks like a duck and it quacks like a duck, then it must be a duck'
- don't check type of a variable
- instead check to see if an attribute or method is present

```python
obj.eat()

# rather than
if isinstance(obj, Dog):
    obj.eat()
```


## Language landscape

For data science, common languages that you should be familiar with (you do not need to know them all - but you should know where they might be used)
- bash
- Python, R
- Scala (and it's relationship with Java & the JVM)
- Javascript (and how it runs in the Browser)
- Julia & Swift (seen as potential Python successors)


### Languages by domain

Fast, operating system languages = C, C++, Rust, Go 

Business = Java
- runs on a Java Virtual Machine (JVM)

Data, scientific = Python, R, Julia

Academics = R, MatLab, Fortran

Web development = Javascript (node.js, React, Vue, Angular), Typescript (strongly typed Typescript, superset of JS) Ruby, Python (Flask, Django)

Browser = Javascript and it's supersets (Typescript etc)

Data engineering = Scala
- Hadoop / Spark written in Scala
- runs on a Java Virtual Machine (JVM)

Mobile = Swift, Kotlin (modern Java on Android)

Notable mentions = Lisp (dynamic, interpreted), Perl, Haskell (functional)


### Scripting languages

Languages that call other programs
- Perl, Bash, Javascript, Ruby, Python
- not a heavy type system


# Practice of programming

*What programmers actually do*

> Taking examples and adapting them to your needs is a skill fundamental not just to visualization, but to all data science and programming in general.

> Nobody knows everything, and the job involves a lot of figuring things out - RUSSELL JURNEY (Agile Data Science)

Most time is spent
- adapting examples (copying code & changing it)
- getting dependencies to work (i.e. installing CUDA)
- using Google to find solutions to error messages (knowing what to search for)

Best way to learn
- write programs
- read other peoples programs (open source is amazing for this)
> [reading code] is really worth it for what it builds in your brain. The more you learn to read other people’s stuff, the more able you are to invent your own in the future  - Donald Knuth 

## What beginners get wrong

Not understanding how a computer works

Not understanding how your language works
- how data structures are implemented
- when data is copied (or not)
- how is memory managed
- how scope is managed

## What gets better

- if something breaks - look at what you just changed
- how to notice when you've done down the wrong path, and how to work backwards from there
- anticipating problems
- know what simple code looks like (having taste)
- recognizing when your code is too complex
- when to refactor & rename 
- when to use class (encapsulation)
- prevent opportunities to be inconsistent 

Seeing unrelated ideas mixed together
- using different libraries in the same function

Seeing / feeling / fearing dependencies

Seeing / feeling / fearing scope (project scope especially :)


## Reading code

Read:

- great writers write a lot, and read even more
- so should a programmer
- read your dependencies (pandas, numpy etc)

Run:

- use the software, understand inputs & outputs
- examine high level structure - `tree` is useful here
- dive into key sections & important data structures - look out for interesting code patterns to learn from

Test:

- write test cases to prove your understanding
- perhaps these can even be added to the project test suite

Importance of having control over your development environment:

- being able to use the operating system of your choice at work
- being able to manage Python effectively on a remote machine
- being able to do things that would be dangerous in production

*Further reading*

- [Read Code - Nemil Dalal](https://www.nemil.com/on-software-engineering/read-code.html)


## Learning a new language

- Read issues (open & closed!) on Github repos of packages/libraries you use,
- Read the standard library.


*Further reading*

- [How To Rapidly Improve At Any Programming Language](https://www.cbui.dev/how-to-rapidly-improve-at-any-programming-language/)
- [To Learn a New Language, Read Its Standard Library](http://patshaughnessy.net/2021/10/23/to-learn-a-new-language-read-its-standard-library)




## Googling error messages

In Python, the most recent (what error happened) error message is at the bottom
- the oldest (the entrypoint, or the start) is at the bottom


```python
data = [10, 20, 30]
def breaks(data):
    data[4] = 40
breaks(data)

# Traceback (most recent call last):
# File "<stdin>", line 4, in <module>
# File "<stdin>", line 3, in breaks
# IndexError: list assignment index out of range
```

Sometimes your error message will include data that is specific to your problem (which may not be useful to Google)
- values of data
- shapes of arrays
- filepaths

```python
import numpy as np
data = np.ones((2, 2))
data[3, 3] = 10
# Traceback (most recent call last):
#   File "<stdin>", line 3, in <module>
# IndexError: index 3 is out of bounds for axis 0 with size 2
```

You may not need to remove these specific details
- Google is pretty good :)

A common bug source is using a different version of libraries

- understand if this can be an issue (i.e. Tensorflow 1 v 2)
- understand what version you are using, and what version the tutorial/Stack Overflow example is using


## Constant debugging

Programming is a never ending process of fixing errors
- constant problem solving
- this is a great thing (always something to do)

Debugging strategies
- print statements
- interactive debugger (`pdb` in Python - life changing)
- logging (reading messages of text files generated by your program)


## Programming is iterative

> One trouble with much of programming is simply that often there is not a well - defined job to be done ; rather, the programming process itself will gradually discover what the problem is! - RICHARD HAMMING

No one gets a program correct the first time
- implement new ideas in parallel with the old ones, rather than mutating the existing code
- easy to switch out implementations if the idea is expressed as a pure function
- internal state / multiple entry points = harder

Kent Beck
1. make it work
2. make it right
3. make it fast

**Only optimize code once it works correctly**

Kernighan's Law

- debugging complex code is harder that simpler
- so write simple code!

> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.


## Technical debt

Technical debt = delaying work that will have to be done in the future

- good technical debt is intentional
- good technical debt is documented
- common to use `TODO` comments

```python
#  TODO fix later
```

You can search for all the `TODO`'s using `grep`:

```bash
$ grep -r 'TODO' .
```

Build the most difficult part of the project first

- to test it, need other parts of the project in place
- one solution to this is scaffolding

Scaffolding

- build something cheap that will be thrown away later
- build it to get the project moving forward
- example in data science would be a mock dataset, or a small model

How do we fix technical debt - refactoring!

Further reading:

- [3 Kinds of Good Tech Debt](https://engineering.squarespace.com/blog/2019/three-kinds-of-good-tech-debt)
- [2014_Sculley_ML_technical_debt](https://papers.nips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf)
- [2014_Sculley_ml_high_interest_credit_card.pdf](https://research.google/pubs/pub43146/)
- [Technical debt as a lack of understanding](https://daverupert.com/2020/11/technical-debt-as-a-lack-of-understanding/)


## Refactoring

> Refactor religiously - Jack Diederich

> The best writing is rewriting - E. B. WHITE

> There is never time to do the job right , but there is always time to fix it later , especially in computer software! - RICHARD HAMMING

- programmer speak for iteration
- cycle of reorganizing and rewriting to improve readability & testability
- repeatedly reorganizing + rewriting
- great programmer spends half his time refactoring

Refactoring has degrees to it
1. just copy paste functions from notebook into scripts, and fix any errors that refer to global vars slipping into functions but not through args
2. actually changing the functionality of the functions - this is MUCH MORE INVOLVED and much riskier (because you don’t know if your changes are working correctly!).

A test suite is crucial to effective refactoring
- can run your test suite as you refactor, to check if you broke anything

Before you can refactor, you need to write code

- write a few functions / classes / entire codebases
- see what code is shared, how design in one part of the system infulences another

The dream is to find simple changes in one part of the code base that remove other parts

*Further reading*

- Brett Slatkin - Refactoring Python: Why and how to restructure your code - PyCon 2016 - [youtube](https://www.youtube.com/watch?v=D_6ybDcU5gc&feature=player_embedded)
- [Why we decided to go for the Big Rewrite](https://tech.channable.com/posts/2019-10-04-why-we-decided-to-go-for-the-big-rewrite.html)


## Code reviews

Involve collaborators

- most often people include others too late
- possibility to make bad choices early on
- difficulty of doing a review of 5,000 lines of code
- people want to be involved if they can make a mark/a direction

Code review forces more than one person to be involved in a project


# Principles of programming

*Ideas, heuristics & mental models - very pretentious*

Mindsets of experienced programmers:
- how do I check this works (is this code tested)?
- why does this code need to change?
- who needs to read it?
- where will this code run? 


## Zen of Python

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

A key idea in the Zen of Python is to prefer simple things:

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

**DRY** = don't repeat yourself

*Further reading*
- [Goodbye, Clean Code](https://overreacted.io/goodbye-clean-code/)


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
- bugs, compatibility with other libraries

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


## Debugging

Print debugging has it's place
- able to visualize the state of a program at different points in time
- customizable view
- also valuable in concurrent programs (parallel or asynchronous)

Formalizing print debugging into logging allows post-event analysis of problems

More powerful debuggers allow interactive programming at one point in time


*Further reading*
- [The unreasonable effectiveness of print debugging](https://buttondown.email/geoffreylitt/archive/starting-this-newsletter-print-debugging-byoc/) - [Hacker News Discussion](https://news.ycombinator.com/item?id=26925570)


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
- unsurprising
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


## Code is bad

> The line of code that’s the fastest to write, that never breaks, that doesn’t need maintenance, is the line you never had to write - STEVE JOBS

Problems should be solved with the least amount of code possible

Code is bad:

- introduces maintenance cost,
- expensive to write,
- often we write our own code for a problem that is solved by someone elses code.

External tools are often a better choice than home-grown solutions:

- better tested & widely used,
- better security updates,
- often cheap compared to software engineer salaries.

Similar logic for using managed services versus installing everything yourself

*Further reading*

- [Don't Write Code](https://www.nemil.com/on-software-engineering/dont-write-code.html)


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
- if your function takes lots of arguments, maybe it should be a class
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

When do I write a class?
- when you are passing around data together (although `dict` may work as well)
- a bundle of mutable data and bunch of related functions
- when you want to model a real world concept (`Dog`, `Model`) etc

- if you have two methods - one being init - it shouldn’t be a class!

If you use class once and throw it away, it could be a lot simpler
- often want multiple instances to get benefit of reuse

Don't overdo inheritance
- single level will solve many problems

Derived class should be usable through the base class interface, without user needing to know the difference

Classes represent real things - but they aren’t those real things!

Representatives of things don’t share the relationships of the things they represent

*Further reading:*
- Jack Diederich - HOWTO Write a Function - [youtube](https://www.youtube.com/watch?v=rrBJVMyD-Gs)
- Jack Diederich - Stop Writing Classes - [video](https://www.youtube.com/watch?v=o9pEzgHorH0)

## Clever versus Insightful Code

Clever code exploits knowledge about the language

- sometimes being clever is easier than being simple,
- the core algorithm may be complex, but the systems around that complexity should be simple.

Insightful code exploits knowledge about the problem


*Further reading:*
- [Clever versus Insightful Code - Hillel Wayne](https://www.hillelwayne.com/post/cleverness/)
- [Hacker News discussion](https://news.ycombinator.com/item?id=27418296)


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


## Clean Code

- The Clean Architecture in Python - Brandon Rhodes - [video](https://youtu.be/DJtef410XaM)
- The Principles of Clean Architecture - [video](https://www.youtube.com/watch?v=o_TH-Y78tt4)


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

Best Practices for Scientific Computing - [text](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)


# Further reading

[Coding habits for data scientists](https://www.thoughtworks.com/insights/blog/coding-habits-data-scientists)

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

[Building Awesome Developer Tools - Lines Montani, PyCon 2019 India Keynote](https://youtu.be/Ivb4AAuj5JY)

[Linux kernel coding style](https://www.kernel.org/doc/Documentation/process/coding-style.rst)

[Things I Learnt The Hard Way (in 30 Years of Software Development)](https://blog.juliobiason.net/thoughts/things-i-learnt-the-hard-way/)

[7 Skills of Highly Effective Programmers](https://medium.com/better-programming/7-habits-of-highly-effective-programmers-563ee3b63f33)

[Design Patterns in Dynamic Programming - Peter Norvig](http://norvig.com/design-patterns/design-patterns.pdf)

Pythonic Guide to Logging - [blog post](https://timber.io/blog/the-pythonic-guide-to-logging/)

https://medium.com/@samsniderheld/how-i-taught-a-machine-to-take-my-job-2dd1adb4df18

Continuous Integration for Machine Learning - [blog post](https://medium.com/@rstojnic/continuous-integration-for-machine-learning-6893aa867002)

[hellerve/programming-talks](https://github.com/hellerve/programming-talks)

spaCy
- [Matthew Honnibal & Lines Montani: spaCy and Explosion: past, present & future](https://youtu.be/Jk9y17lvltY)
- [Lines Montani: Python India Keynote](https://www.youtube.com/watch?v=Ivb4AAuj5JY)

Robert (Uncle Bob) Martin
- The Scribe's Oath - [youtube](https://www.youtube.com/watch?v=X31Jc6HQUcs)
- Craftsmen - Control Your Environment - [youtube](https://www.youtube.com/watch?v=NZNhtYVb6H8)

[The Exceptional Beauty of Doom 3's Source Code](https://kotaku.com/the-exceptional-beauty-of-doom-3s-source-code-5975610)

- Code should be locally coherent and single-functioned: One function should do exactly one thing. It should be clear about what it’s doing.
- Local code should explain, or at least hint at the overall system design.
- Code should be self-documenting. Comments should be avoided whenever possible. Comments duplicate work when both writing and reading code. If you need to comment something to make it understandable it should probably be rewritten.

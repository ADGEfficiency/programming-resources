# Links

[Linux kernel coding style](https://www.kernel.org/doc/Documentation/process/coding-style.rst)

[Things I Learnt The Hard Way (in 30 Years of Software Development)](https://blog.juliobiason.net/thoughts/things-i-learnt-the-hard-way/)

[3 Kinds of Good Tech Debt - Jon Thornton - Squarespace](https://engineering.squarespace.com/blog/2019/three-kinds-of-good-tech-debt)

## [The Skills Poor Programmers Lack - Justin Meiners](https://justinmeiners.github.io/the-skills-programmers-lack/)

Three fundamental skills are often missing:
1. understanding the language & what is going on inside the computer

Minimal level is [a course on data structures](http://opendatastructures.org/ods-python/) and [a course on assembly & architecture](http://inst.eecs.berkeley.edu/~cs61c/sp15/).

```python
if isDelivered and isNotified: isDone = True else: isDone = false;

versus

isDone = isDelivered and isNotified
```

2. Anticipating problems

Careful programmers think through states & transitions of programs

Don't generate random file names and hope a collision doesn't happen

3. Organizing & designing systems

Design is not just making short functions - **the real problem is writing code that mixes unrelated ideas**.

Good software = well defined concepts & clear responsibilities.

Useful strategies
- design patterns & SOLID for classes
- functional programming for pure functions with no side effects
- model-view-controllor to separate storage & UI from business logic

Good design = easy to change

Best way to learn = write & study lots of programs

[Think in Math. Write in Code. - Justin Meiners](https://justinmeiners.github.io/think-in-math/)

Programming languages 
- implementation tool (not thinking tools)
- strict and formal

Thinking tools
- should be free & flexible

Math = thinking tool for computation
- reason about logical structures

Basic programming pattern
1. identify problem
2. design algorithm & data structure to solve it
3. implement & test

Ideally steps 1 & 2 should be solved first, then a programming language used for step 3

**Separate thinking from implementation**
- implementation can distract from the problem

Programming languages = poor abstraction tools
- black boxes = hides contents, only show input & output
- boxes leak because brief description can't determine the behaviour

[up to Most importantly for problem-solving, black boxes are rigid]

[Learn more programming languages, even if you won't use them](https://thorstenball.com/blog/2019/04/09/learn-more-programming-languages/)

Languages shape the way we think*, each in their own peculiar way. That’s true for programming languages as well. Each language contains a different mental model, a different perspective for thinking about computation and how to write programs.

[Things I was wrong about when I started programming](https://javascriptplayground.com/things-i-was-wrong-about-javascript/)

Less code is not always better
- I am now very eager to extend a function’s body by a line or two if I can introduce more clarity to the code to help me and my teammates understand it.

Some technical debt is OK
- Bad code isn’t bad code because it’s written badly; it’s bad code if it slows you down, causes bugs for users, or constantly breaks. That’s the code you need to fix.

Software development is all about tradeoffs
- The single most important skill for a developer in my opinion is to be humble, willing to admit that you made a mistake, but be eager to understand why your choice was wrong, how you could have realised that sooner, and learn from it

[7 absolute truths I unlearned as junior developer](https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/)

Not all experience is created equal
- that’s why mentors are so important, and the team you work with is worth so much more than a couple bucks in your paycheck

Loads of companies and startups have little or no tests. 
- no company has a perfect tech setup.
- being overly opinionated on topics you lack real-world experience with is pretty arrogant.
- good enough is good enough.

Documentation lies sometimes.
- focus on automation over documentation where appropriate. 

Disorganized or messy code isn’t the same as technical debt.
- Having some technical debt is healthy
- If you think your codebase is free of technical debt, there is a good chance you’re over-emphasizing polish instead of delivery. And boy did I do that!

[Applying the Gestalt Principles to your code](https://yetanotherchris.dev/clean-code/gestalt-principles/)

The Gestalt principles concern themselves with how we visually perceive groups of objects

(the) principles exist because the mind has an innate disposition to perceive patterns in the stimulus based on certain rules. These principles are organized into five categories: Proximity, Similarity, Continuity, Closure, and Connectedness.

1. Similarity - group variables together
2. Good form - if you have a well formed object you won’t notice the parts it’s made up of
3. Proximity - the space between objects (close to similarity) -
4. Closure - group formed if they appear to form a whole
5. Continuation - intersection of two objects appears to the eye as one single object

## Readability

Reader should be able to figure out in a minute what a function does

## Functions

What does the function do?  Should be as long as it needs to be.

### Greg Ward - How to Write Reusable Code - PyCon 2015 - [video](https://www.youtube.com/watch?v=r9cnHO15YgU)

- functions = compute stuff & returns value with no side effect
- procedure = has side effects
- don't combine functions and procedures in the same function
 
### Jack Diederich - HOWTO Write a Function - [youtube](https://www.youtube.com/watch?v=rrBJVMyD-Gs)

- return early if possible (holdover from C - compiler would require/need a single return)
- All effort is not useful effort - but all effort feels like useful effort
- define things where you use them (ie lists to append too etc) - the reason not to do this is a holdover from C

Job hard enough without trying to clever up the place
Always and nevers - this talk doesn’t have them
Not all effort is useful effort

Code review 
- the last chance, the gatekeeper 
- reviews force you to think about how the code will be read

Reader should be able to figure out in a minute what a function does

Functions are about WHAT - what does the function do
- function should go on as long as it has too

Input
- get info
- don't get what you don't need
- early errors are good errors (ie input checks)
- asserts add information

Transform
- should be boring
- exceptions should be exceptional

Output
- pretty print results
- executions should be really surprising
- format info the way caller expects
- use assert statements - they are low overhead and tells reader what is going to happen
- return once = form old compilers (no longer true) = use as many returns as you need
- returning early adds confidence - return early when you can

If you can get away without using a temporary - don’t use it (skip the temporary)
- means reader has less to worry about 

Exceptions show that you have thought about your failure conditions

rules for `**kwargs` - hurts readability, use only where you have too

### Jack Diederich - Stop Writing Classes - [video](https://www.youtube.com/watch?v=o9pEzgHorH0)

- if you have two methods - one being init - it shouldn’t be a class!
- don’t make new execeptions when you don’t need to
- refactor religiously 

Zen of Python = prefer easy things
* simple better than complex
* flat is better than nested
* readability counts
* if the implementation is hard to explain, its a bad idea
* if the implementation is easy to explain, is might be a good idea

Don't do hard things in the first place, or revert complications later

How to notice when you've done down the wrong path, and how to work backwards from there

If you use class once and throw it away, it could be a lot simpler

First thing you need to do with code is to read it

Don't write code you don't need

Use class with bundle of mutable data and bunch of related functions

## Refactoring

Cycle of reorganizing and rewriting to improve readability & testability

### Brett Slatkin - Refactoring Python: Why and how to restructure your code - PyCon 2016 - [youtube](https://www.youtube.com/watch?v=D_6ybDcU5gc&feature=player_embedded)

Wrote effective Python - 59 ways!

Refactoring 
- repeatedly reorganizing + rewriting until it's obvious to a new reader
- readability and testability
- great programmer spends half his time refactoring
- instead of using a conditional - use a class with `__bool__` and then use ` if instance then` etc.  Allows easier testing


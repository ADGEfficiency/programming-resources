# Python

[Python's strftime directives](http://strftime.org/)


## Starters

[The Python Tutorial](https://docs.python.org/3/tutorial/)

[An Effective Python Environment: Making Yourself at Home - Real Python](https://realpython.com/effective-python-environment/)

[Scipy Lecture Notes](https://scipy-lectures.org/index.html)

[ipython-cookbook](https://github.com/ipython-books/cookbook-2nd)

[Stop using utcnow and utcfromtimestamp](https://blog.ganssle.io/articles/2019/11/utcnow.html) - [HN](https://news.ycombinator.com/item?id=33138302)


## Advanced

[Python Design Patterns](https://python-patterns.guide/)


## Courses

[Google Python course](https://developers.google.com/edu/python/introduction)

[Learn Python the Hard Way](https://learnpythonthehardway.org)


## Textbooks

[Think Python - Allen Downey](https://greenteapress.com/thinkpython2/thinkpython2.pdf)

[Effective Python: 59 Specific Ways to Write Better Python - Brett Slatkin](https://effectivepython.com/)

[Automate the Boring Stuff with Python - Al Sweigart](https://automatetheboringstuff.com/)

[Fluent Python - Luciano Ramalho](http://shop.oreilly.com/product/0636920032519.do)


## Useful tools

[The hand-picked selection of the best Python libraries and tools of 2024](https://www.reddit.com/r/Python/comments/1hbs4t8/the_handpicked_selection_of_the_best_python/?share_id=2URiFsSNPV3SGxdeps8SC&utm_name=androidcss)

[argparse builder](https://blog.rfox.eu/en/Programming/Tools_I_use/Tools_I_use_argparse_builder.html) - a simple graphical interface for quick creation of the argparse commandline switches for your scripts


## Blog posts

[How to Write Beautiful Python Code With PEP 8](https://realpython.com/python-pep8/) from Real Python.

How to set up a perfect Python project - Brendan Maginnis - [text](https://sourcery.ai/blog/python-best-practices/)

[Python’s Innards: Introduction](https://tech.blog.aknin.name/2010/04/02/pythons-innards-introduction/)


## Code Examples

krother/advanced_python - [github](https://github.com/krother/advanced_python)

krother/software-engineering-python - [github](https://github.com/krother/software-engineering-python)


## Talks

Raymond Hettinger - Dataclasses: The code generator to end all code generators - PyCon 2018 - [youtube](https://youtu.be/T-TwcmT6Rcw)

 Raymond Hettinger: Numerical Marvels Inside Python - Keynote | PyData Tel Aviv 2022 - [youtube](https://youtu.be/wiGkV37Kbxk)

[How to Write Python Code Others Like to Use - Anna Tisch - Kiwi Pycon X](https://youtu.be/xZSGo4vM-ok)

[Top to down, left to right (Surprise talk) - James Powell](https://youtu.be/BRn6UCw35og)

[Jonas Neubert - What is a PLC and how do I talk Python to it? - PyCon 2019](https://youtu.be/a0l29lgDf6k)

[Modern Python Developer's Toolkit - Sebastian Witowski](https://pycon.switowski.com/)

[Road to Python 3 - Lisa Guo, Hui Ding Keynote PyCon 2017](https://youtu.be/66XoCk79kjM)

[Memory Management in Python - The Basics - PyCon 2016 - Nina Zakharenko](https://www.youtube.com/watch?v=F6u5rhUQ6dU)

[Untitled12.ipynb | PyData Eindhoven 2019 - Vincent D. Warmerdam](https://youtu.be/yXGCKqo5cEY)

High Performance Data Processing in Python || Donald Whyte - [youtube](https://www.youtube.com/watch?v=nmYyISMdOqY)
- how python and numpy works at memory level

[Losing your Loops Fast Numerical Computing with NumPy - Jake VanderPlas](https://www.youtube.com/watch?v=EEUXKG97YRw)

Ned Batchelder - Big-O: How Code Slows as Data Grows - PyCon 2018 - [youtube](https://www.youtube.com/watch?time_continue=1&v=duvZ-2UK0fc)

Brandon Rhodes: All Your Ducks In A Row: Data Structures in the Std Lib and Beyond - PyCon 2014 - [youtube](https://www.youtube.com/watch?v=fYlnfvKVDoM&feature=player_embedded)

Greg Ward - How to Write Reusable Code - PyCon 2015 - [video](https://www.youtube.com/watch?v=r9cnHO15YgU)

How to make a good library API PyCon 2017 - [video](https://www.youtube.com/watch?v=4mkFfce46zE)

Jack Diederich - HOWTO Write a Function - [youtube](https://www.youtube.com/watch?v=rrBJVMyD-Gs)

Jack Diederich - Stop Writing Classes - [video](https://www.youtube.com/watch?v=o9pEzgHorH0)

Brett Slatkin - Refactoring Python: Why and how to restructure your code - PyCon 2016 - [youtube](https://www.youtube.com/watch?v=D_6ybDcU5gc&feature=player_embedded)

Alex Gaynor: Fast Python, Slow Python - PyCon 2014 - [video](https://www.youtube.com/watch?v=7eeEf_rAJds)

Transforming Code into Beautiful, Idiomatic Python - Raymond Hettinger - [youtube](https://www.youtube.com/watch?v=OSGv2VnC0go)

PyCon 2010: The Mighty Dictionary - [youtube](https://www.youtube.com/watch?v=C4Kc8xzcA68)

Hidden Treasures in the Standard Library - [video](https://pyvideo.org/pycon-us-2011/pycon-2011--hidden-treasures-in-the-standard-libr.html)

Raymond Hettingier - Python's Class Development Toolkit - [youtube](https://www.youtube.com/watch?v=HTLu2DFOdTg&t=528s)

Raymond Hettingier - Modern solvers: Problems well-defined are problems solved - PyCon 2019 - [youtube](https://www.youtube.com/watch?v=_GP9OpZPUYc)

Jeff Reback - What is the Future of Pandas - [youtube](https://www.youtube.com/watch?v=_-gJtO0XR48)

["Python Oddities Explained" - Trey Hunner (PyCon AU 2019)](https://youtu.be/4MCT4WLf7Ac?t=35)

Python is not block scoped
- list comprehensions have their own scope
- for loops don't have their own scope

Two ways to change things in Py
- change variable (assignment)
- change object (mutation)

Can read globals always
- can't assign to globals in local scope

Scope matters with assignment, not with mutation

Lists don't contain objects, they contain references to memory locations

```python
x = []
x.append(x)
```

Variables don't contain objects, they are names that point to objects

`+=` on lists & tuples
- will not mutate tuples (instead create new object)
- will mutate lists (same object mutated)

Duck typing

[Guido van Rossum: Python | MIT Artificial Intelligence (AI) Podcast](https://www.youtube.com/watch?v=ghwaIiE3Nd8)

Transforming Code into Beautiful, Idiomatic Python - Raymond Hettinger - [youtube](https://www.youtube.com/watch?v=OSGv2VnC0go)

[Python: DevOps for Electrical Engineers](https://medium.com/@rsatterlee/python-for-electrical-engineers-f538338f2ff)

[The best explanation of Python decorators I’ve ever seen. (An archived answer from StackOverflow.)](https://gist.github.com/Zearin/2f40b7b9cfc51132851a)

Jeff Reback - What is the Future of Pandas - [youtube](https://www.youtube.com/watch?v=_-gJtO0XR48)

Ned Batchelder - Big-O: How Code Slows as Data Grows - PyCon 2018 - [youtube](https://www.youtube.com/watch?time_continue=1&v=duvZ-2UK0fc)

Hidden Treasures in the Standard Library - [video](https://pyvideo.org/pycon-us-2011/pycon-2011--hidden-treasures-in-the-standard-libr.html)

High Performance Data Processing in Python || Donald Whyte - [youtube](https://www.youtube.com/watch?v=nmYyISMdOqY)
- covers how python and numpy works at memory level

PyCon 2010: The Mighty Dictionary - [youtube](https://www.youtube.com/watch?v=C4Kc8xzcA68)

Thinking Recursively in Python [article](https://realpython.com/python-thinking-recursively/)

7 Habits to Improve The Performance of Python Programs - [blog post](https://www.tutorialdocs.com/article/7-habits-to-improve-python-programs.html)

How to make a good library API PyCon 2017 - [video](https://www.youtube.com/watch?v=4mkFfce46zE)

[An A-Z of useful Python tricks - Medium](https://medium.freecodecamp.org/an-a-z-of-useful-python-tricks-b467524ee747)

## Elana Hashman - Teaching Python: The Hard Parts - PyCon 2016 - [video](https://www.youtube.com/watch?v=CjYEpVNbM-s)

- explain the inconsistent syntax - ie foo.len() versus len(foo)
- start teaching testing early - teaching it later makes it sound not important
- be aware of your own shortcomings
- set reasonable expectations

## Brandon Rhodes: All Your Ducks In A Row: Data Structures in the Std Lib and Beyond - PyCon 2014 - [youtube](https://www.youtube.com/watch?v=fYlnfvKVDoM&feature=player_embedded)

Talk ignores data compression (bus to ram) + memory hierarchy

Some data structures (linked lists, doubly-linked list, trees of all kinds) don't appear in Python because Python data structures don't contain data, they contain addresses

- bit = 0 or 1
- byte = 8 bits, can represent 0-255

Computer memory = array of bytes, named by integer addresses

RAM = parallel that provide random access to different locations.  Parallel across memory to find the bytes that are wanted (they go onto the databus)

Address arithmetic (adding and subtracting) = handles the data structures at the machine level - records (sequence of fields in agreed order) and arrays

Records in Python = reference count (8 bytes) and then 8 bytes for address of the type (ie int, float etc)

String = variable length, 6 different 8 byte then the string itself

Retrieve a record by adding record start address + field's offset

Unicode = 4 bytes per character

Record = addition, hereto
Array = multiplication, homo
Both give immediate access to data you want

### Python arrays

Array = everything in it is the same (same length).  Given an array `b` bytes long, item `i` lives at `address + bi`

`struct` can be built in python (C level structure).  Can be useful for binary conversations with C libraries or I/O

Array useful for binary conversations with C or I/O

Indexing is fast because of the use of arrays at the machine level

But accessing its items from Python requires repeated object building.  To sum an array of 100 floats, Python needs to build >100 `float` objects

## Numpy

Numpy to the rescue.  Numpy supports math operations without building intermediate objects, they happen at the C level

Python can't use raw records of arrays because it is dynamic - the main datastructures are general purpose 

i.e. tuple of different types - array address math (`a+bi`) depends on every element being the same length (`b`)

Python tuple contains an array of addresses!  Data structures without the data

Moving an item means only copying an address - there will only be one copy of an object, regardless of how many times it appears in an object

### List = pythons most dangerous data structure

Lists are like tuples but they can grow.  To grow, it might need to move - but Python objects can't change addresses - Python solves this by having an address for addresses

Python lists reserve extra room to avoid reallocation (which is expensive)

Thousand and million check - what is the cost of doing this operation a thousand times?  And a million times?

Thousand -> million
- O(n) = 3 zeros
- O(nlog(n)) = 4 zeros
- O(n2) = 6 zeros

Append on a list asks for extra item slots (4, 8, 16, 25, 35, 36...) - this solves the problem.  This is called amortization - because it spreads the cost over time (like a mortgage).  This is bumpy (ie you pay for one additional append, but then the next `n` are free etc)

The list is a tradeoff - saving time by wasting space.  Lists use on average 94% of their slots, but get linear time

The problem is that some single item operations need to touch each element in the list.  Appending is fast, inserting at the beginning is slow

### Slicing - copy versus view

Normally when slicing a slice of size `n` costs `n` address copies (expensive)

np/pd slices are views (no data copying) -> fast

### Dicts

Dicts - behind each dict is an array where keys are stored at indexes according to their hash value (an integer).  Each slot must store both the key and value (hash, key address, value address)

Dict grows by doubling or quadrupling - amortizes resize cost.  Resizes at 2/3 full to avoid collisions - only ever 1/3 - 2/3 full

Given a key, a dict can hash it and jump right to it's slow

All dict operations are fast and therefore safe for beginners

Because dict assigns key to array indices by hash, it iterates in arbitrary order

Set = dict with only keys (no values)

Classes are implemented with dictionaries - each attribute is a key in a hidden dictionary.  Classes that pre-specify `slots` are implemented as a `struct`

`bisect` = to get all numbers greater than or less than a number (uses binary search)

Deque is used in the multiprocessing `Queue`

`heapq` allows fetching top `t` of `n` items in O(t+n) time

`nlargest()` and `nsmallest()`

## Raymond Hettingier - Python's Class Development Toolkit - [youtube](https://www.youtube.com/watch?v=HTLu2DFOdTg&t=528s)

Document as you go

Never be as agile as before you start writing code

Inheriting from object - get extra capability

Only instance variables should be instance variables. Use class variable to share between all instances

__init__ !=. a constructor.

Self = the instance, it is already made once your __init__ is called

Takes an existing instance and populates it

Yangey = you anti gonna need it - don’t add features in before you know whether you need it

Start with minimum possible

Too many features is a bad thing

People who get good at one language, check those rules into another language (ie private variables from java into python)

Converter and adapter function

Constructor war = want to construct the class using different inputs (ie from a radius or from a bounding box)

Answer = offer different methods

Use a class method as an alternative method

Problem here is that this method will always return a Circle (never a Tire) - need to think about subclass

Class Tire(Circle) - works by using cls (supports subclassing)

Static method = to attach methods to classes (improves findability and ensure function used in the correct context)

Put all the tools in the toolbox

All problems have easy to understand, simple and wrong answers

Keeping a spare copy of a method by using `__` underscores. Class local references

Use `__.method` to make sure you refer to you (not your children classes). Allows subclasses to overwrite methods without breaking methods in subclasses

`@property` - can be added later to attributes. Can’t do in a compiled language (but can in a dynamic language)

Flyweight design matter - deals with memory issues from multiple classes. Always save til last

`__slots__`

Surpasses instance dict, saves memory

Slots aren’t inherited 

Cost of cache miss as expensive as floating point divide (importance of memory)

## Alex Gaynor: Fast Python, Slow Python - PyCon 2014 - [video](https://www.youtube.com/watch?v=7eeEf_rAJds) - [review](https://github.com/ADGEfficiency/personal/blob/master/reviews/work/fast_slow_python.md)

Benchmarks are lies - impossible to reduce performance to a single number

Performance is about specialization
- specialize the algorithm for the use case
- specialize code to get it to run faster

Dynamically typed languages can't be optimize in the same way as static - but that doesn't mean their aren't ways to optimise then
- slow versus hard to optimize

Allocations and copies make things slow

Dictionaries are not specialised. Classes are specialised.

Dicts 
- good for mapping things to other things
- mapping or arbitrary keys to arbitrary values
- not a replacement for classes

Object has a fixed set of properties. Object appears as a new thing to the interpreter (same as for named tuples)
- use objects to represent things you have an understanding of

Myths - especially for other types of python (not cpython)

- function calls are expensive
- Only use built in data types
- Don't write python like java/C

[Memory Management in Python - The Basics - PyCon 2016 - Nina Zakharenko](https://www.youtube.com/watch?v=F6u5rhUQ6dU)

Python has automatic garbage collection (c doesn't)

hex(id(o))

c style
- fixed size bucket
- same sized data
- changing the value means that we chatge the data stored in that memory location

python
- names = label for an object, objects can have lots of names
- references = name of container that points at aonther object
- objects
- simple objects (numbers & strings) - store their own values
- containers (dict, lists) & classes = store references to simple objs or other containers

reducing ref count
- del statement = reduces ref count (doesnt delete obj)
- changing the ref
- var out of scope

global namespace = ref count never reaches 0!

sys.getsizeof(obj) # gives size in bytes

sys.getrefcount(object) # ref count

garbage collection = program automatically releasing memory
- added space (storing ref count) & oxecution overhead (chinging ref counts)

GIL = exists because we can't change ref counts concurrently
- makes garbage collection fast & simple
- but means we can only execute one thread in a python program

means we need to use multiprocessing

## classes

print(obj.__dict__)

all obj hawve type, value, ref count

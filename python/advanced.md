---
id: advanced
aliases: []
tags: []
---

[Advanced, Overlooked Python Typing - by Martynas Šubonis](https://martynassubonis.substack.com/p/advanced-overlooked-python-typing)

Overloading

[How to Write a Spelling Corrector](https://norvig.com/spell-correct.html)

[Jonas Neubert - What is a PLC and how do I talk Python to it? - PyCon 2019 - YouTube](https://www.youtube.com/watch?v=a0l29lgDf6k)

PLC = programmable logic controller
- where software meets atoms & electrons

Field devices
- sensors - real world -> electrical signal -> variable in code
- actuators - variable in code -> electrical signal -> effect in real world

Many different kinds of electrical signals

[Ten Python datetime pitfalls, and what libraries are (not) doing about it | Arie Bovenberg](https://dev.arie.bovenberg.net/blog/python-datetime-pitfalls/)

[14 Advanced Python Features | Edward Li's Blog](https://blog.edward-li.com/tech/advanced-python-features/)

Overload to type different signatures for one func:

```python
from typing import Literal, overload


@overload
def transform(data: str, mode: Literal["split"]) -> list[str]: ...


@overload
def transform(data: str, mode: Literal["upper"]) -> str: ...


def transform(data: str, mode: Literal["split", "upper"]) -> list[str] | str:
    if mode == "split":
        return data.split()
    else:
        return data.upper()
```

Keyword vs positional only args:

```python
def foo(a, b, /, c, d, *, e, f):

# / = positional before
# * = keyword after
```

RnR
- Generics
- Protocols
- Match with destructuring
- Walrus


```
for thing in things:
    if conditional:
        break

else:
```

[Advanced Python Features | Hacker News](https://news.ycombinator.com/item?id=43769486)


[Why We Went All In on Type Completeness](https://www.prefect.io/blog/why-we-went-all-in-on-type-completeness)

[Shape typing in Python](https://jameshfisher.com/2024/04/12/shape-typing-in-python/)

```python
type Mat[N, M] = np.ndarray[
    tuple[N, M],
    np.dtype[np.float64],

def mat_mul[
    N, K, M
](
  m1: Mat[N, M],
  m2: Mat[M, K],
) -> Mat[N, K]:
    return m1 @ m2
]
```


# Enum

Could use an enum instead of a dispatch dict:

```python
from enum import Enum


class ShapePoints(Enum):
    X = 1
    Y = 2
    Z = 3


def points_per_shape(shape: str) -> int:
    return ShapePoints[shape].value
```

# Class attributes

```
class Monkey:
    monkeys = {}

  def __init__(self, id: int):
      self.id = id
      Monkey.monkeys[id] = self

Monkey(1)
Monkey(2)
print(Monkey.monkeys[1])
```


## StringIO, BytesIO

## [Strict Python function parameters](https://sethmlarson.dev/strict-python-function-parameters)

Keyword only - all parameters to the right in the function signature can't be passed as positional arguments:

```python
def process_data(data, *, encoding="ascii"):
```
Positional-only parameters - The / in the function signature means that all parameters to the left of the / are positional-only:

```
def process_data(data, /, encoding="ascii"): ...
```

Possible to combine both:

```python
def process_data(data, /, *, encoding="ascii"): ...
```


## f-strings

[5 Useful F-String Tricks In Python](https://www.youtube.com/watch?v=EoNOWVYKyo0)

Integer formatting:

```python
n = 1000000000
print(f"{n:_}")
print(f"{n:,}")
```

Alignment:

```python
var = "var"

# left align with 20 characters
print(f"{var:>20}:")

# center align with 20 characters
print(f"{var:^20}:")

# right align with 20 characters
print(f"{var:20}:")
```

Datetime formatting:

```python
from datetime import datetime

now = datetime.now()
print(f"{now:%y-%m-%d}")
```

Float formatting:

```python
n = 1234.5678

# round to 2 decimal places
print(f"{n:.2f}")

# thousand separator
print(f"{n:,.2f}")
```

```python
a = 5
b = 10
var = "bob says hi"

print(f"{a + b = }")
```

## Walrus Operator

```python
match = func()
if match is not None:
  do()

if (match := func()) is not None:
```

## Decorator

```python
def decorator(func):
    def wrapper(*args, **kwargs):
        #  do stuff before function call
        func()
        #  do stuff after function call
        return None

    return wrapper
```

## Debugging using pdb

pdb

`display` code will run the Python code you give to it and display the value. It will do this when you call it, then every time some part of the program is executed AND the value changes. So it may display the value if you call next, continue, until, etc.

## Iterating smarter

zip, enumerate

## Cost of Python objects

```python
import sys

print(sys.version)
d = {
    "int": 0,
    "float": 0.0,
    "dict": dict(),
    "set": set(),
    "tuple": tuple(),
    "list": list(),
    "str": "",
    "unicode": "",
    "object": object(),
}
for k, v in sorted(d.items()):
    print(k, sys.getsizeof(v))
```

---

[Python Type Hints - *args and **kwargs - Adam Johnson](https://adamj.eu/tech/2021/05/11/python-type-hints-args-and-kwargs/) - [HN](https://news.ycombinator.com/item?id=37282385)

[Strict Modules](https://instagram-engineering.com/python-at-scale-strict-modules-c0bb9245c834)

[Python’s Innards: Introduction](https://tech.blog.aknin.name/2010/04/02/pythons-innards-introduction/)

[Python behind the scenes #4: how Python bytecode is executed](https://tenthousandmeters.com/blog/python-behind-the-scenes-4-how-python-bytecode-is-executed/)

[satwikkansal/wtfpython](https://github.com/satwikkansal/wtfpython) - What the f*ck Python? 😱

[An exploration of why Python doesn't require a 'main' function](https://utcc.utoronto.ca/~cks/space/blog/python/WhyNoMainFunction)

The core reason that Python doesn't require a main() function is a combination of its execution model (specifically for what happens when you import something) and that under normal circumstances you start Python programs by (implicitly) importing a single file of Python code.

In many languages things like functions, classes, and so on are created (defined) by the interpreter or compiler as it parses the source file. In Python, this is not quite the case; instead, def and class are executable statements, and they define classes and functions when they execute (among other things, this is part of why metaclasses work). When Python imports something, it simply executes everything in the file (or the import more generally).

Compiled languages traditionally have a model where code from a bunch of separate files is all sort of piled up together. In Python, you can't really aggregate multiple files together into a shared namespace this way; one way or another, you have to import them and everything starts from some initial file.

[Don't let dicts spoil your code - Roman Imankulov](https://roman.pt/posts/dont-let-dicts-spoil-your-code/)

Dictionaries are mutable and opaque.

Better to use a model:

```python
class GitHubRepo:
    """GitHub repository."""

    def __init__(self, owner: str, name: str, description: str):
        self.owner = owner
        self.name = name
        self.description = description

    def full_name(self) -> str:
        """Get the repository full name."""
        return f"{self.owner}/{self.name}"


def get_repo(repo_name: str) -> GitHubRepo:
    """Return repository info by its name."""
    data = requests.get(f"https://api.github.com/repos/{repo_name}").json()
    return GitHubRepo(data["owner"]["login"], data["name"], data["description"])
```

In many cases, you can and should ignore most of the fields coming from the API, adding only the fields that the application uses.

Dataclasses, Pydantic, TypedDicts if legacy.

A good use case of dicts is for key-value mappings:

```python
colors = {
    "red": "#FF0000",
    "pink": "#FFC0CB",
    "purple": "#800080",
}
```

[Don't let dicts spoil your code (2020) | Hacker News](https://news.ycombinator.com/item?id=31879015)

The article is not explaining the point, which I believe is: type your dicts if you want to provide strict guarantees to your downstream about data shape.

[Writing Python like it’s Rust](https://kobzol.github.io/rust/python/2023/05/20/writing-python-like-its-rust.html)

[How uv got so fast | Andrew Nesbitt](https://nesbitt.io/2025/12/26/how-uv-got-so-fast.html)

[The Optimization Ladder - Cemrehan Çavdar](https://cemrehancavdar.com/2026/03/10/optimization-ladder/)

Python is slow because of its dynamic design, not just the GIL or interpretation
- Every operation requires runtime type dispatch because methods, builtins, and inheritance can be changed at any time
- The GIL is irrelevant for single-threaded performance; free-threaded 3.13/3.14t actually makes single-threaded code slower due to refcount overhead

When to stop climbing (the effort curve is exponential)
- Upgrade Python first; it's free
- Mypyc if already typed
- NumPy if vectorizable; JAX if you can go functional
- Numba for tight numeric loops
- Cython/Rust only if you genuinely need the ceiling
- Most code is I/O-bound or dict-bound; profile before optimizing

---

Rung 0: Upgrade CPython for free gains
- 3.10 → 3.11 gives ~1.4x on n-body thanks to the Faster CPython project

Rung 1: Alternative runtimes (PyPy, GraalPy) for 6-66x with zero code changes
- PyPy (tracing JIT): 13x on both benchmarks
- GraalPy (Truffle/GraalVM method JIT): 66x on spectral-norm, 5.9x on n-body
- Catches: C-extension compatibility layers, GraalPy stuck on 3.12, JVM warmup for GraalPy

[Python: The Optimization Ladder | Hacker News](https://news.ycombinator.com/item?id=47327703)

The practical ladder collapses to two rungs for many (redgridtactical)
- Python + numpy/scipy, then drop to C for hot paths
- Middle rungs add complexity without fully solving the problem
- Counter: JAX gives you an array language without leaving Python, avoiding hand-tuned C for GPU paths

Why isn't Python as fast as JavaScript? (threethirtytwo)
- gsnedders: JS operators return restricted type sets and can't be overridden (+ only returns string/number); primitives limit dynamism; only Proxy objects pay the full dynamic cost
- gf000: Python's role as C glue language exposes internal details (refcount manipulation from C) that make optimization nearly impossible without breaking the ecosystem
- GraalPy matches JS-order performance because it's willing to compromise that C-API compatibility
- 12_throw_away: also just economic — JS gets orders of magnitude more optimization investment

The "just use a faster language" camp vs the "Python is fast enough" camp
- IshKebab: "All of the effort you go through to make Python not slow is far less work than just don't use Python"; rewrote a project 1:1 in Rust and got 50x free
- atomicnumber3: 99% of code is fast enough in Python and iteration speed matters more
- scuff3d: Go and modern Java/C# aren't much harder to write than Python and get close to Rust performance
- LarsDu88: Python's network effects in AI/ML won due to historical accident; Go was too young, C# too corporate

[Functional Programming Bits in Python - by Martynas Šubonis](https://martynassubonis.substack.com/p/functional-programming-bits-in-python)

Python is a poor fit for pure FP but can borrow FP techniques pragmatically
- Lacks persistent data structures, so immutability is expensive
- No tail-call optimization, making recursion a weak loop substitute

singledispatch enables ad-hoc polymorphism as an alternative to isinstance/match dispatch
- Turns a function into a type-routed registry, similar to Haskell type classes
- Lets new types be added in separate modules without modifying the original function
- Addresses Open-Closed Principle concerns with centralized isinstance chains, especially when the base function lives in third-party code (avoids monkey-patching)
- Tradeoff: adds indirection; overkill for small, local dispatch where isinstance is more readable due to locality of data and behavior
- singledispatchmethod is the equivalent for instance methods
- Commentary: the OCP argument is somewhat overstated — centralized dispatch is often fine and easier to reason about; singledispatch shines mainly at library/extension boundaries

```python
"""
singledispatch is a decorator from Python's standard library (functools) that turns a regular function into a generic function — one whose actual implementation is chosen at runtime based on the type of its first argument.

You write one "base" function, then register type-specific implementations. When you call it, Python looks at the type of the first argument and dispatches to the matching registered implementation.
"""
from functools import singledispatch

@singledispatch
def describe(x: object) -> str:
    return f"some object: {x!r}"  # fallback

@describe.register
def _(x: int) -> str:
    return f"integer: {x}"

@describe.register
def _(x: list) -> str:
    return f"list of {len(x)} items"


describe(42)         # "integer: 42"          -> int implementation
describe([1, 2, 3])  # "list of 3 items"      -> list implementation
describe("hello")    # "some object: 'hello'" -> falls back to base
```

partial fixes arguments to reshape a function's arity
- Useful for adapting an n-ary function to a consumer expecting fewer args (e.g., making a predicate for filter)
- Placeholder sentinel allows non-contiguous positional binding, avoiding lambda boilerplate or operator-flipping tricks
- Tradeoff vs lambdas: partial is more declarative and introspectable but less flexible; lambdas are more familiar to most Python readers

```python
"""
functools.partial takes a function and some arguments, and returns a new callable with those arguments "pre-filled."
"""
from functools import partial

def log(level: str, message: str) -> None:
    print(f"[{level}] {message}")

info = partial(log, "INFO")
warn = partial(log, "WARN")

info("server started")   # [INFO] server started
warn("disk almost full") # [WARN] disk almost full
```

starmap bridges product types to n-ary functions
- Auto-unpacks tuples from zip/groupby into positional args, skipping destructuring lambdas
- Keeps pipelines declarative by offloading unpacking to the iterator protocol

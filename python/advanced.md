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

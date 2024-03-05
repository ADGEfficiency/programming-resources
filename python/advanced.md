[Python Type Hints - *args and **kwargs - Adam Johnson](https://adamj.eu/tech/2021/05/11/python-type-hints-args-and-kwargs/) - [HN](https://news.ycombinator.com/item?id=37282385)

[Strict Modules](https://instagram-engineering.com/python-at-scale-strict-modules-c0bb9245c834)

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
var = 'var'

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
     "unicode": u"",
     "object": object(),
}
for k, v in sorted(d.items()):
     print(k, sys.getsizeof(v))
```

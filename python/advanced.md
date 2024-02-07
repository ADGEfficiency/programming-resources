[Strict Python function parameters](https://sethmlarson.dev/strict-python-function-parameters)

[Python Type Hints - *args and **kwargs - Adam Johnson](https://adamj.eu/tech/2021/05/11/python-type-hints-args-and-kwargs/) - [HN](https://news.ycombinator.com/item?id=37282385)

[Strict Modules](https://instagram-engineering.com/python-at-scale-strict-modules-c0bb9245c834)

## StringIO, BytesIO

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

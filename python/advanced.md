## StringIO, BytesIO


## Walrus Operatior

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
        #  run func
        #  do stuff after
        #  return
        return func(*args, **kwargs)

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



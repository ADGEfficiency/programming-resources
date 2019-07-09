## Asserts

Asserts are low overhead, and help the reader understand the code

Common asserts in machine learning are to check the shapes of your training and test data:

```python
assert x.shape[0] == y.shape[0]
assert x_test.shape[1] == x_train.shape[1]
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

## Using functions well

```
if check:

   return   
```

rather than
```
if check:

else:
```

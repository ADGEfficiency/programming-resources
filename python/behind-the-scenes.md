# Python Behind The Scenes

Internals of CPython - the most popular Python implementation.


## [1 - How the CPython VM works](https://tenthousandmeters.com/blog/python-behind-the-scenes-1-how-the-cpython-vm-works/)

Garbage collection + reference counting = Cpython specific

CPython = designed to be easy to maintain

Three stages of execution of Python:
1. initialization - data structures, modules, imports
2. compilation - translate source into intermediate representation
3. interpretation

Compilers
- parse source into Abstract Syntax Tree
- generate bytecode from AST
- some bytecode optimizations

```python
#  example.py
def g(x):
    return x + 3
```

This is translated into the bytes `[124, 0, 100, 1, 23, 0, 83, 0]`

```bash
$ python -m dis example.py
2           0 LOAD_FAST            0 (x)
            2 LOAD_CONST           1 (3)
            4 BINARY_ADD
            6 RETURN_VALUE
```

Heart of CPython = virtual machine that executes bytecode
- stack based - stack stores & receives data

Code objects = blocks of code not bytecode (such as functions or modules)



## [](https://tenthousandmeters.com/blog/python-behind-the-scenes-2-how-the-cpython-compiler-works/)


## [](https://tenthousandmeters.com/blog/python-behind-the-scenes-3-stepping-through-the-cpython-source-code/)


## [](https://tenthousandmeters.com/blog/python-behind-the-scenes-4-how-python-bytecode-is-executed/)


## [](https://tenthousandmeters.com/blog/python-behind-the-scenes-5-how-variables-are-implemented-in-cpython/)

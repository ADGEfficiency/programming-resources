---
id: python-behind-the-scenes
aliases: []
tags:
  - python
  - programming
  - software-development
  - computer-science
---

[Python behind the scenes #1: how the CPython VM works](https://tenthousandmeters.com/blog/python-behind-the-scenes-1-how-the-cpython-vm-works/)

Python has no formal specification

Garbage collection + reference counting = Cpython specific

CPython = designed to be easy to maintain

Python is defined partly by the Python Language Reference and partly by its main implementation, CPython

Execution of a Python program roughly consists of three stages:

1. Initialization: Init data structures, built in types, setup import system
2. Compilation: Parse source code, build AST, generate bytecode & optimizations
3. Interpretation

## What is bytecode?

```python
def g(x):
    return x + 3
```

CPython translates the body of the function `g()` to the following sequence of bytes:

```
[124, 0, 100, 1, 23, 0, 83, 0]
```

If we run the standard dis module to disassemble it, here's what we'll get:

```shell-session
$ python -m dis example1.py
...
2           0 LOAD_FAST            0 (x)
            2 LOAD_CONST           1 (3)
            4 BINARY_ADD
            6 RETURN_VALUE
```

Python bytecode is (opcode, arg) pairs:

```
124, 0  → LOAD_FAST    0        (load x)
100, 1  → LOAD_CONST   1        (load 3)
23, 0  → BINARY_OP    ADD      (x + 3)
83, 0  → RETURN_VALUE
```

At the heart of CPython is a virtual machine that executes bytecode. By looking at the previous example you might guess how it works. CPython's VM is stack-based.

A "stack" here means a last-in, first-out (LIFO) container the VM uses to hold intermediate values while running bytecode. This is a software stack, nothing to do with CPU.

Most instructions implicitly operate on the stack rather than naming operand registers.

It means that it executes instructions using the stack to store and retrieve data:

- `LOAD_FAST` instruction pushes a local variable onto the stack.
- `LOAD_CONST` pushes a constant.
- `BINARY_ADD` pops two objects from the stack, adds them up and pushes the result back.
- `RETURN_VALUE` pops whatever is on the stack and returns the result to its caller.

Code block = bit of code executed as a unit (module or function body)
- Running code is evaluating the corresponding code block

Code objects = stores a code block, bytecode, variables used within the block

Function block = stores a function
- function is more than a code block - includes additional info of function name, docstring etc

```
def f(x):
    return x + 1

print(f(1))
```

```shell-session
$ python -m dis example2.py

1           0 LOAD_CONST               0 (<code object f at 0x10bffd1e0, file "example.py", line 1>)
            2 LOAD_CONST               1 ('f')
            4 MAKE_FUNCTION            0
            6 STORE_NAME               0 (f)

4           8 LOAD_NAME                1 (print)
           10 LOAD_NAME                0 (f)
           12 LOAD_CONST               2 (1)
           14 CALL_FUNCTION            1
           16 CALL_FUNCTION            1
           18 POP_TOP
           20 LOAD_CONST               3 (None)
           22 RETURN_VALUE
...
```

Frame block = where current code started to be run, and where to go on return

- Frame = state in which code object can be executed
- New frame created whenever another code object is executed

Thread state = data structure that has thread specific data
- call stack, exception state, debugging settings
- not same as the OS thread

GIL = state of CPython from corruption without introducing more fine-grained locks

Interpreter & runtime states
- help manage multiple threads







[](https://tenthousandmeters.com/blog/python-behind-the-scenes-2-how-the-cpython-compiler-works/)
[](https://tenthousandmeters.com/blog/python-behind-the-scenes-3-stepping-through-the-cpython-source-code/)
[Python behind the scenes #4: how Python bytecode is executed](https://tenthousandmeters.com/blog/python-behind-the-scenes-4-how-python-bytecode-is-executed/)
[](https://tenthousandmeters.com/blog/python-behind-the-scenes-5-how-variables-are-implemented-in-cpython/)

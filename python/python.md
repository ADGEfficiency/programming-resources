## Structure

Python uses indentation (ie whitespace) rather than `;` to organize code.  Comments are lines beginning with `#`.

```python
for element in iterable:
	#  within loop
	do_stuff()

#  loop has finished

def my_func():
	#  local scope within function
	return var
```

## Primitives

```python
float(16) = 16.0

int(16.0) = 16

str(16) = '16'

bool(8) = True

bool(0) = False
bool(None) = False
```

## Iterables

```python

#  immutable - elements can't be changed
mytuple = ('a', 5, 'b')

#  mutable
mylist = ['hello', 10, 'bye']

#  dictionaries store key-value pairs
mydict = {'morning': 20, 'afternoon': 30}

#  we can access elements in both tuples, lists and dicts using []
>>> first = mytuple[0]
'a'

>>> last = mylist[-1]
'bye'

>>> morning = mydict['morning']
20

# can access slices in tuples and lists
>>> mytuple[1:3] 
(5, 'b')

#  negative indexes allow us to index relative to the end
>>> mylist[0:-1] 
['hello', 10, 'bye']

>>> mylist[-2:-1] 
[10, 'bye']
```

## Iterating over iterables

A common pattern is to iterate over a list, while saving the results in a new list

```python
oldlist = [10, 20, 30]

newlist = []
for element in oldlist:
	newlist.append(element * 10)

>>> newlist
[100, 200, 300]
```

Sometimes we want an integer index to use while iterating

```python
oldlist = [10, 20, 30]

newlist = []
for idx in range(len(oldlist)):
	newlist.append(oldlist[idx] * 10)

>>> newlist
[100, 200, 300]
```

We can also iterate over dictionaries - note that order is not guaranteed.

```python
for key, value in mydict.items():
    print(key, value)

morning, 20
afternoon, 30
```

## Functions

Functions allow us to control scope and reuse code.  A local scope is made during the function call, which dissapears after the function ends.

```python

def myfunc(arg1, arg2):

	result1 = arg1 + arg2
	result2 = arg1 * arg2

	return result1, result2

r1, r2 = myfunc(10, 100)
```

## Classes

Classes allow us to control scope, reuse code and maintain state.

```python

class MyClass:

	def __init__(self, arg1):
		self.arg1 = arg1

	def operation(self, arg2):
		self.state = self.arg1 * arg2
		return self.state

instance = MyClass(10)

instance.operation(20)
>>> 200

instance.state
>>> 200
```

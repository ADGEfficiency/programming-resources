# Python

[Python's strftime directives](http://strftime.org/)


## Starters

[The Python Tutorial](https://docs.python.org/3/tutorial/)

[An Effective Python Environment: Making Yourself at Home - Real Python](https://realpython.com/effective-python-environment/)

[Scipy Lecture Notes](https://scipy-lectures.org/index.html)


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

[argparse builder](https://blog.rfox.eu/en/Programming/Tools_I_use/Tools_I_use_argparse_builder.html) - a simple graphical interface for quick creation of the argparse commandline switches for your scripts


## Blog posts

[How to Write Beautiful Python Code With PEP 8](https://realpython.com/python-pep8/) from Real Python.

How to set up a perfect Python project - Brendan Maginnis - [text](https://sourcery.ai/blog/python-best-practices/)

[Python’s Innards: Introduction](https://tech.blog.aknin.name/2010/04/02/pythons-innards-introduction/)


## Code Examples

krother/advanced_python - [github](https://github.com/krother/advanced_python)

krother/software-engineering-python - [github](https://github.com/krother/software-engineering-python)


## Talks

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


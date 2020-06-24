# Computers

Introductory course on computing.


![](assets/1846-Weidenbach-nilinsel-philae.jpg)

*Nilinsel Philae - Ernst Weidenbach - 1846*


## Key takeaways

What are bits and bytes?

Working model of computer hardware
- CPU, RAM, storage, GPU

Compilers versus interpreters
- tradeoff of development speed versus program speed


## Computers do two things

1. compute - transforming data
2. memory - storing data


## Computers are three things

1. CPU - sequential computation
1. memory - stores data
1. input / output (I/O)

The basic idea
- data is accessed from memory
- compute is done on the CPU
- data is put back into memory


## Types of computers

- PC - laptop, desktop
- server - responds to network requests
- mobile
- embedded devices - cars
- mainframe - large, custom server
- supercomputers - many processors working together


# Programming languages

How to tell computers what to do

- syntax = rules
- semantics = meaning behind text
- libraries = pre-existing code (standard library)
- tools (compliers, linkers, interpreters, text editors, profiler, debugger, IDE)


## Instructions

Sequence of bits that represent actions
- copy bytes
- add, multiplication
- bit logic - NOT, AND, OR, XOR
- jumps - branching etc


## Binary - what computers read

Bit = `0` or `1`
- one bit of infomation

Binary code = `011100100`
- also known as machine code

Historically this code was run 
- mechanically (switches, vacuum tubes)
- in punch cards (allowing repetition)

Byte = 8 bits
- a byte can represent the integers from $0$ to $255$

```
one bit -> 2 numbers (0, 1)
two bits -> 4 numbers (0, 1, 2, 3)
three bits -> 8 numbers (0, 1, ... 7)
...
n bits -> 2^n numbers
```

We can represent binary in different forms.  For the decimal `999999`, the binary representation is `11110100001000111111`, and in hexadecimal `F423F`

Computers think in base 2 (one bit has two states)
- we group in base 10 (10 things at a time)
- computers group things in 2 (2 things at a time)
- having memory (RAM & storage) in sizes like 1024 MB is so that the computer can use it efficiently
- often see powers of 2 in programs (32, 64 etc)


We can use sequences of bits to represent actions we want the CPU to do
- copy bytes
- add, multiplication
- bit logic - NOT, AND, OR, XOR
- jumps - branching etc


## Assembly

Binary is what machines fundamentally understand - but programming directly in binary is inefficient

Assembly
- one to one mapping between instruction & binary (`ADD` -> `01110011`)
- processor specific

Hello World on Intel x86-64:

```assembly
global start
section .text
start:
  mov rax, 0x2000004 ; write
  mov rdi, 1 ; stdout
  mov rsi, msg
  mov rdx, msg.len
  syscall
  mov rax, 0x2000001 ; exit
  mov rdi, 0
  syscall
section .data
msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
```

[programming-resources/fundamentals/hello.s](https://github.com/ADGEfficiency/programming-resources/tree/master/fundamentals)
- compile the source assembly code into binary
- link with system libraries to produce an executable (this can sometimes happen dynamically at runtime)

Both machine & assembly only offer simple abstractions
- we want **high level languages**
- offer complex abstractions
- are powerful tools


## Compilers versus interpreters

Many languages mix these together
1. compile
2. interpret
3. compile then run in VM

- development speed
- program speed
- portability


## Compilers

A **compiler** is used to 
- translate high level programs into machine code

Notice that we compile assembly into binary
- this same idea is used in higher level languages (C, C++ etc)

The difference with compiling code 
- not a one to one mapping to binary / machine instructions

After compilation we get an executable
- the complier can produce optimized code
- complied programs are fast

[programming-resources/fundamentals/hello.c](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/hello.c)
- compile source `.C` file into executable binary

```C
#include <stdio.h>
int main() {
   // printf() displays the string inside quotation
   printf("Hello, World from C!");
   return 0;
}
```


## Interpreters

An **interpreter** can be used to
- examine a program one piece at a time
- generates & executes machine language one piece at a time

A program that directly executes code
- no requirement for compulation, no executable produced
- just runs
- examples include Lisp, Python

Interpreters allow interactive programming
- speeds up development time
- no need to recompile after changing source
- cost of having to do work from scratch each time the program is run
- some of this work is done only once (`.pyc`, in `/__pycache__`)

The Python interpreter
- translate source `.py` to bytecode
- immediately execute in a virtual machine

[programming-resources/fundamentals/hello.py](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/hello.py)
- run the Python file (works because of the shebang line)

```python
#!/usr/bin/env python3
print('Hello World from Python!')
```


## Properties of programming languages

> Languages shape the way we think, each in their own peculiar way. That’s true for programming languages as well. Each language contains a different mental model, a different perspective for thinking about computation and how to write programs - Thorsten Ball


So far we have looked at three languages (Assembly, C, Python) via their `Hello World` programs

Languages differ in many ways - one of the most important is **the abstractions offered to the programmer**

TODO put somewhere
- programmer control (can be better than machine, in the best case)
- overhead - memory management, interpretation, dynamic typing (must check types)

Python = 10 - 100x slower
- depends on the task
- can't speedup I/O

Properties of languages
- high versus low level
- computer versus programmer time
- static versus dynamic
- strong versus weak typing
- compiled versus interpreted (covered above)
- memory management
- size of community
- how functional
- how object oriented


## High versus low level

How close to the metal you are
- binary -> Assembly -> C -> Python

Higher level languages can offer more useful abstractions
- `print('Hello World')` - `print` is useful


## Computer time versus programmer time

Classic tradeoff between how fast a program is versus how hard a language is to use 
- computer time has become cheaper 
- programmer time is as valuable as ever

Compiled languages are fast to run
- often difficult to write (static typing etc)


## Types & type inference

Most languages offer primitive data structures
- strings, floats, integers

Knowing the type of a variable is crucial to knowing what we can do with it
- this is type inference

Variables, function in & out, list items (can only be same type)


## Static versus dynamic typing

- When you detect type errors (before or after running code)
- How useful the tooling for your language can be

Useful for compiler, tooling

Static typing
- declared the type of a variable 
- before runtime
- helps prevent bugs
- helps compilers to generate fast code
- restricts what kind of programs you can write

```python
msg: str = 'Hello World'
```

Dynamic typing
- not declaring types
- types checked at runtime
- slower
- more flexible

```python
msg = 'Hello World'
```

Dynamically typed languages can't be optimize in the same way as static - but that doesn't mean their aren't ways to optimise then
- slow versus hard to optimize

Allocations (i.e. of memory) and copies make things slow


## Strong versus weak typing

Strong typing
- data can be manipulated only with operations for that data's type
- types are defined by what operations you can do on them

Weak typing
- can manipulate data in anyway


## Memory management

Manual memory management

Garbage collection
- based on reference counting

Memory leak = not freeing heap memory after it isn't being used
- made easier in GC, but still can have leaks with GC (global vars etc)


## Size of community

Maturity of language

Availability of libraries, tooling


## How functional

Functional programming = not changing / relying on state
- immutable variables

Idempotent (functional)
- function always returns the same thing, whenever it runs
- not affected by, or affects, the outside world

But the entire value of programs is that they do modify state!
- functional = about isolating where you rely upon & impact the outside world


## How object oriented

OOP
- abstraction = hiding implementation complexity
- encapsulation = using classes to combine data & function (can also be to protect data access via getters & setters)


## All paradigms remove capability from the programmer

Three align with the three big concerns of architecture: function, separation of components, and data management.

### 1 - Structured programming

Limits direct transfer of control (ie no `GOTO`)

Allows functional decomposition

### 2 - Object Oriented Programming

Discipline on indirect transfer of control

OOP
- encaspsulation = hiding details in a class (abstraction!)
- inheritance = class having subclasses (`Cat` & `Dog` class inherits from `Animal`)
- polymorphism = subclasses can override methods of the parent class

```python
class Animal:
    def eat(self): 
		  return 'still hungry'

class Dog(Animal):
    def eat(self): 
		  return 'full'
```

Duck typing
- an object's suitability is determined by the presence of certain methods and properties, rather than the type of the object itself
- 'If it walks like a duck and it quacks like a duck, then it must be a duck'

```python
obj.quack()
```

### 3 - Functional programming

- easy to switch out implementations if the idea is expressed as a pure function
- internal state / multiple entry points = harder

Variables never changed
- immutable variables help with concurrency

Separate components that do versus do not mutate variables

Infinite data storage allows immutable variables
- this is how git works!
- no state, can generate state from history


## Portability

- using on different platforms

Four issues
- CPU instruction sets (fix by not using assembly)
- system calls (fix using interfaces)
- capabilities (hardware)
- libraries


## Scripting languages

Languages that mostly call other programs

bash
- the language of the shell
- popular alternatives zsh or Fish

Scripting languages
- Perl, Bash, Javascript, Ruby, Python
- not a heavy type system


## Landscape

Fast = C, C++, Rust

Business = Java

Data, scientific = Python , R , Julia

Academics = R, MatLab, Fortran

Web, browser = Javascript, Ruby, Python, Go

Data engineering = Scala

Mobile = Swift, Kotlin

Notable mentions = Lisp, Perl, Haskell


# Hardware

What we use to do compute & store data


## CPU

If/else, sequential execution of instructions
- instructions are binary sequences (`1101100` -> `ADD`)

ISA - Instruction Set Architecture
- different for different CPU (x86 etc)

Has local memory
- registers, caches

> At their core, they solve a problem of learning a policy in the context of a markov decision process, so they fall under the umbrella of reinforcement learning. But this can be easily missed, since those algorithms incorporate so much domain-specific knowledge, and employ bags of custom tweaks and optimizations - to the point they’re barely recognizable by statisticians.That’s actually a good thing, and a sharp and refreshing contrast compared to the unguided “plug-and-play” approach for ML which is way too common for anyone’s good. - From [Machine Learning. Literally.](http://www.trivialorwrong.com/2016/06/08/machine-learning-literally.html)

Branch predictor = predicts what program will do next
- crucial for instruction level parallelism, which is a major driving force behind high-performance computing
- predict expected result of jump instructions
- over 99% accurate

Cycle
- discrete time step in CPU
- 2.2 GHz = 2.2 billion cycles per second

Iron law of processor performance:

$$Time / Program = Instruction / Program * Cycles / Instruction * Time / Cycle$$

Instructions per cycle = most of the recent improvements
- parallelism

## GPU

GPU = matrix multiplication, parallel operations
- has local memory - typical ML GPU is 12 GB


## Memory

- how much (MB, GB)
- how fast

Processor local memory
- registers, caches

RAM 
- Random Access Memory
- volatile (lose it when powered off)
- arrays of bytes
- parallel access of bytes by integer addresses
- fast
- store code & data of running programs
- typical laptop has 8 - 16 GB

Hard drives
- non-volatile
- SSD, spinning disk
- typical laptop has 256 - 1024 GB


## I/O

Input / Output
- hardware that communicates with the computer
- keyboard, mouse, network card

Port 
- logical connection method between two end points
- operate at the Transport layer of the OSI
- example = VPN client connecting to VPN server over port 1723

Socket
- one end point of a connection
- means of plugging application layer in
- determined by an IP address and port number
- example = VPN client connects through a socket determined by the port number and IP of the local client


# Operating systems

Software that manages your computer
- hardware, software, access to resources

Linux, OSX
- UNIX based (POSIX compliant)
- most serious computing done on Linux based systems
- means that the same programs work on OSX

Windows
- more challenging development environment
- but it is getting much better!
- [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)


## Processes

Program = sequential instructions 

Process = program in execution
- identified by a PID in Unix systems
- keeps data in RAM


## Threads

Flow of execution through the process code

Lightweight process

Allow parallelism


## Memory management

Moves processes back and forth between the main memory and the disk during execution

- keeps track of each and every memory location
- checks how much memory is to be allocated to processes
- decides which process will get memory at what time
- tracks whenever memory gets freed up or unallocated

Process address space is the set of logical addresses that a process references in its code
- when 32-bit addressing is in use, addresses can range from 0 to 0x7fffffff (hexadecimal)
- try running `print(object())` in Python


## References

[Hardware Basics - Brian Will](https://www.youtube.com/watch?v=9-KUm9YpPm0)

[How Operating Systems Work: 10 Concepts you Should Know as a Developer
](https://medium.com/cracking-the-data-science-interview/how-operating-systems-work-10-concepts-you-should-know-as-a-developer-8d63bb38331f)

[Hackers & Painters: Big Ideas from the Computer Age](https://en.wikipedia.org/wiki/Hackers_%26_Painters) - Chapter 10

Alex Gaynor: Fast Python, Slow Python - PyCon 2014 - [video](https://www.youtube.com/watch?v=7eeEf_rAJds)

[Machine Learning. Literally.](http://www.trivialorwrong.com/2016/06/08/machine-learning-literally.html)


## Further reading

[What Your Computer Does While You Wait](https://manybutfinite.com/post/what-your-computer-does-while-you-wait/)

[What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)

[memorymanagement.org](https://www.memorymanagement.org/) - [faq](https://www.memorymanagement.org/glossary/m.html#term-memory-management)

[What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

[John Carmack on Parallel Implementations](http://sevangelatos.com/john-carmack-on-parallel-implementations/)

[Code fearlessly](http://cam.ly/blog/2010/12/code-fearlessly/)

[The Clean Architecture in Python - Brandon Rhodes](https://youtu.be/DJtef410XaM)

Justin Abrahms: Computer science fundamentals for self-taught programmers - PyCon 2014- [video](https://www.youtube.com/watch?v=nEquiifH33w)

[Building Software Systems At Google and Lessons Learned - Jeff Dean](https://www.youtube.com/watch?v=modXC5IWTJI)

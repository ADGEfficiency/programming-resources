# Computers

## What computers read

Binary

**Bit** = $[0, 1]$

A byte can represent the integers from $0$ to $255$

one bit -> 2 numbers (0, 1)
two bits -> 4 numbers (0, 1, 2, 3)
three bits -> 8 numbers (0, 1, ... 7)
...
n bits -> 2^n numbers

One **byte** = 8 bits -> (0-255)

Computers think in base 2 (one bit has two states), so computers group things in 2.
- we like to think in base 10 (ie 10 things at a time)

Having memory (RAM & storage) in sizes like 1024 MB is so that the computer can use it efficiently

## Hardware

CPU = if/else, sequential

RAM = random access memory, parallel
- arrays of bytes
- parallel access of bytes by integer addresses

Storage = SSD or spinning disk

GPU = matrix multiplication, parallel operations

## Float 32 vs 64

float32 is a 32 bit number - float64 uses 64 bits
- float64 take up twice as much memory - and doing operations on them may be a lot slower in some machine architectures.
- float64 can represent numbers much more accurately than 32 bit floats, they also allow much larger numbers to be stored.

# Operating systems

[How Operating Systems Work: 10 Concepts you Should Know as a Developer
](https://medium.com/cracking-the-data-science-interview/how-operating-systems-work-10-concepts-you-should-know-as-a-developer-8d63bb38331f)

UNIX, Linux & OSX

Windows
- more challenging development environment
- but it is getting much better!
- [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

## Processes

Process = program in execution
- identified by a PID in Unix systems

Program = sequential instructions 

The process keeps data in RAM

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
- when 32-bit addressing is in use, addresses can range from 0 to 0x7fffffff
- try running `print(object())` in Python

# Programming languages

> Languages shape the way we think, each in their own peculiar way. That’s true for programming languages as well. Each language contains a different mental model, a different perspective for thinking about computation and how to write programs - Thorsten Ball

[Hackers & Painters: Big Ideas from the Computer Age](https://en.wikipedia.org/wiki/Hackers_%26_Painters) - Chapter 10

## Computer time versus programmer time

Computer time has become cheaper
- programmer time is as valuable as ever

## Landscape

Fast = C or C++

Business = Java

Data, scientific & web = Python

Academics = R or MatLab

Web/browser = Javascript

Data engineering = Scala

## Machine code

Lowest level = machine code/language 
- binary
- `011100111`
- all code becomes binary in the end

Machine code is **close to the metal**

Assembly is a more convenient form of machine language:

```assembly
   put the number 10 in memory location 0
a  if location 0 is negative, go to line b   
   beep   
	 subtract 1 from the number in location 0   
	 go to line a

b  ...rest of program...
```

Both machine & assembly only offer simple abstractions
- we want **high level languages**
- offer complex abstractions
- are powerful tools

Fortran, Lisp, Cobol, Basic, C, Pascal, Smalltalk, C++, Java, Perl, and Python are all high-level languages
- C is low level, Lisp high level

Not many programmers work in assembly 
- instead we can use **compiler** or **interperter**

## Compilers and interperters

A **compiler** is used to 
- translate high level programs into machine code

Compiled
- declare variables & their types
- static type checking in editors

An **interpreter** can be used to
- examines program one piece at a time
- generates & executes machine language one piece at a time

Interpreted
- no compiling (or compile time)
- interactive interperter
- dynamically typed

 
## Type inference

In a statically-typed language, you have to know the kind of values each variable can have at the time you write the program. With dynamic typing, you can set any variable to any value, whenever you want

Do I tell the compiler what the types are (and always will be) or not?

Static 
- helps prevent bugs
- helps compilers to generate fast code
- restricts what kind of programs you can write

Dynamic
- slower
- more flexible

Alex Gaynor: Fast Python, Slow Python - PyCon 2014 - [video](https://www.youtube.com/watch?v=7eeEf_rAJds) - [review](https://github.com/ADGEfficiency/personal/blob/master/reviews/work/fast_slow_python.md)

Dynamically typed languages can't be optimize in the same way as static - but that doesn't mean their aren't ways to optimise then
- slow versus hard to optimize

Allocations (i.e. of memory) and copies make things slow

## Object-oriented versus functional 

C, Lisp, Go, Rust

Object oriented
- Python, C++, Java, JS (?)

Functional programming = computation returns data with no side effect, variabes are immutable
- Haskell

Garbage management
- Python uses reference counting
- C the programmer must manually do it

## Scripting

bash
- the language of the shell
- popular alternatives zsh or Fish

Scripting languages
- Perl, Bash, Javascript, Ruby, Python
- not a heavy type system

## Port and sockets

Port 
- logical connection method between two end points
- operate at the Transport layer of the OSI
- example = VPN client connecting to VPN server over port 1723

Socket
- one end point of a connection
- means of plugging application layer in
- determined by an IP address and port number
- example = VPN client connects through a socket determined by the port number and IP of the local client

## Text encoding

ASCII code for printable characters has been surpassed by UTF 8, which includes ASCII as a subset, and HTML, the code used for websites, has two different color codes in use: HEX code and RGB triplets, for example.

## Further reading

[What Your Computer Does While You Wait](https://manybutfinite.com/post/what-your-computer-does-while-you-wait/)

[What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)

[What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

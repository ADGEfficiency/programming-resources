# Computers

## Hardware

CPU = if/else, sequential

RAM = random access memory, parallel

Storage = SSD or spinning disk

GPU = matrix multiplication, parallel

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

## Float 32 vs 64

float32 is a 32 bit number - float64 uses 64 bits.That means that float64’s take up twice as much memory - and doing operations on them may be a lot slower in some machine architectures.However, float64’s can represent numbers much more accurately than 32 bit floats.They also allow much larger numbers to be stored.

## Memory

Arrays of bytes

Random access memory (RAM) is parallel access of bytes by integer addresses

# Operating systems

[How Operating Systems Work: 10 Concepts you Should Know as a Developer
](https://medium.com/cracking-the-data-science-interview/how-operating-systems-work-10-concepts-you-should-know-as-a-developer-8d63bb38331f)

UNIX, Linux & OSX

Windows
- more challenging development environment
- subsystem for Linux

## Processes

Process = program in execution
- identified by a PID in Unix systems

Program = sequential instructions 

The process keeps data in RAM

## Threads

flow of execution through the process code

lightweight process

Allow parallelism

## Memory management

moves processes back and forth between the main memory and the disk during execution

- keeps track of each and every memory location
- checks how much memory is to be allocated to processes
- decides which process will get memory at what time
- tracks whenever memory gets freed up or unallocated

Process address space is the set of logical addresses that a process references in its code
- when 32-bit addressing is in use, addresses can range from 0 to 0x7fffffff
- try running `print(object())` in Python

# Programming languages

> Languages shape the way we think*, each in their own peculiar way. That’s true for programming languages as well. Each language contains a different mental model, a different perspective for thinking about computation and how to write programs - Thorsten Ball

All becomes binary in the end

Fast = C or C++

Business = Java

Data = Python

Academics = R

## Interpreted versus compiled

Interpreted
- no compiling (or compile time)
- interactive interperter
- dynamically typed

Compiled
- static type checking in editors
- declare variables

---

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


## Scripting

bash
- the language of the shell

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
- 
## Text encoding

ASCII code for printable characters has been surpassed by UTF 8, which includes ASCII as a subset, and HTML, the code used for websites, has two different color codes in use: HEX code and RGB triplets, for example.

## Further reading

[What Your Computer Does While You Wait](https://manybutfinite.com/post/what-your-computer-does-while-you-wait/)

[What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)

[What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

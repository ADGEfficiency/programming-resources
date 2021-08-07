# Computers

*How computers work*

- [hardware](#hardware)
- [operating systems](#operating-systems)
- [binary & assembly](#binary-&-assembly)
- [high level languages](#high-level-languages) - compilers & interpreters


![](assets/1846-Weidenbach-nilinsel-philae.jpg)

*Nilinsel Philae - Ernst Weidenbach - 1846*


# Key takeaways

After this lecture you should

- have a working model of computer hardware
- know what a bit and byte are
- know the difference between an assembler, compiler & interpreter


# What is a computer?

## Three things

**Why do we use computers** - what are their functions - what do they do?
1. computation - transforming data
2. memory - storing data
3. communication - with other computers

**What is a computer?**
1. CPU - sequential computation
1. memory - stores data
1. input / output (I/O)

**What does a computer do** - what are it's fundamental, primitive operations?
- access data from memory
- compute new data on CPU
- put data back in memory


# Hardware

*What we use to do compute & store data - physical things you can touch*


## Types of computers

There are many different configurations of hardware

- PC - laptop, desktop
- server - responds to network requests
- mobile
- embedded devices - cars
- mainframe - large, custom server
- supercomputers - many processors working together

**All of these have in common a CPU + memory**
- this maps directly back to the first two reasons why we use computers (compute & memory)

## Compute

### CPU

[CPU - Wiki](https://en.wikipedia.org/wiki/Central_processing_unit)

The central processing unit (CPU) executes instructions

- these are executed in order
- instructions are binary sequences (`1101100` -> `ADD`)
- instructions include basic arithmetic, accessing memory etc

A CPU has it's own local memory
- store code & data of running programs
- registers, caches

A CPU instruction cycle is composed of a fetch + decode + execute step

- fetch an instruction from memory
- decode the instruction (from bits to instruction)
- execute (take an action)

Modern CPU's can have multiple cores
- a core = a processor
- multiple cores can run in parallel
- one core can run one thread or one process
- vector processors can operate in parallel (low array operations)

A better CPU has
- larger cache
- faster processor
- multiple cores

32 vs 64 bit processors = 64 bit processor has more memory


### Iron law of processor performance

`time / program = (instructions / program) * (cycles / instruction) * (time / cycle)`

Instructions per program
- program length

Instructions per cycle 
- a simple instruction = one cycle
 
It is possible to complete multiple instructions in one cycle
- or one instruction can take multiple cycles

Processor speed
- clock speed = cycles / second (2.2 GHz = 2.2 billion cycles per second)
- clock cycle = time to run one cycle (0.3 nanoseconds at 3.0 Ghz)

Instruction level parallelism
- work done by the compiler & processor to parallelize a program

Branch predictor = predicts what program will do next
- crucial for instruction level parallelism, which is a major driving force behind high-performance computing
- predict expected result of jump instructions
- over 99% accurate

*Further reading*
- [Machine Learning. Literally.](http://www.trivialorwrong.com/2016/06/08/machine-learning-literally.html)
- [Moore's Law - Wiki](https://en.wikipedia.org/wiki/Moore%27s_law)

*Further watching*
- [Jim Keller: Moore's Law, Microprocessors, and First Principles](https://youtu.be/Nb2tebYAaOA)
- [David Patterson: Computer Architecture and Data Storage](https://youtu.be/naed4C4hfAg)
- [Jim Keller - Not Dead Yet: Moore’s Law and the Future of Computers](https://youtu.be/Qnl7--MvNAM)


### GPU & TPU

GPU = Graphics Processing Unit
- rendering graphics
- matrix multiplication, parallel operations
- made of thousands of CPU cores + memory (1080 Ti = 3,584 cores, 12 GB memory)
- has local memory (1080 Ti = 11 GB)

TPU = Tensor Processing Unit
- dedicated to neural nets

For data science, the GPU memory is often a bottleneck

- large data samples (images) mean small batch sizes
- important to use a pool of CPU workers to serve batches to GPUs (to keep them from starving)


## Memory

Data storage
- how much data (MB, GB)
- how fast to read & write data (MHz)

Historically (and still today) memory is the fundamental limit and challenge in computing

- faster memory is more expensive


### Different layers of memory

Processor local memory
- registers, caches

**RAM = Random Access Memory**
- fast (parallel access of bytes by integer addresses)
- volatile (lose it when powered off)
- arrays of bytes
- store code & data of running programs
- typical laptop has 8 - 16 GB

**Hard drives** - the disk
- slow, mass storage
- non-volatile
- SSD, spinning disk
- typical laptop has 256 - 1024 GB


### Real versus virtual memory

[Measuring memory usage: virtual versus real memory](https://lemire.me/blog/2021/07/29/measuring-memory-usage-virtual-versus-real-memory/)


## I/O

Input / Output
- hardware that communicates with the computer
- keyboard, mouse, network card

Port 
- logical connection method between two end points
- example = VPN client connecting to VPN server over port 1723

Socket
- one end point of a connection
- means of plugging application layer in
- determined by an IP address and port number
- example = VPN client connects through a socket determined by the port number and IP of the local client



# Operating systems

Software that manages your computer
- hardware, software, access to resources
- time sharing the CPU between different programs - music player, browser

Linux, OSX
- UNIX based (POSIX compliant)
- most serious computing done on Linux based systems
- means that the same programs work on OSX

Windows
- more challenging development environment
- but it is getting much better!
- [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- [Windows Terminal](https://github.com/microsoft/terminal)


## Processes

Program = sequence of instructions

Process = instance of program in execution
- identified by a PID in Unix systems
- keeps data separate in RAM
- has threads 

[Process - Wikipedia](https://en.wikipedia.org/wiki/Process_(computing))


## Threads

Flow of execution through the process code
- shares memory with other threads
- like a lightweight process

[Thread - Wikipedia](https://en.wikipedia.org/wiki/Thread_(computing))


## Memory management

Moves processes back and forth between the main memory and the disk during execution

- keeps track of each and every memory location
- checks how much memory is to be allocated to processes
- decides which process will get memory at what time
- tracks whenever memory gets freed up or unallocated

Process address space is the set of logical addresses that a process references in its code
- when 32-bit addressing is in use, addresses can range from `0` to `0x7fffffff` (hexadecimal)

Python uses garbage collection

- automatic
- removes old objects based on a reference count

*Further reading*

- [What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)
- [memorymanagement.org](https://www.memorymanagement.org/) - [faq](https://www.memorymanagement.org/glossary/m.html#term-memory-management)


# Machine code & assembly

The CPU performs computation - it does this using a set of instructions:
- copying / reading / writing data
- addition, multiplication
- bit logic - NOT, AND, OR, XOR
- jumps - branching etc

ISA - Instruction Set Architecture
- different for different CPU (x86 etc)

These differences in instruction sets are why compiling can be challenging
- you need to know what instruction set to know how to compile code into the correct assembly

*Further reading*
- [Instruction set architecture](https://en.wikipedia.org/wiki/Instruction_set_architecture#Instruction_types)


## Machine code

Historically code was run mechanically (switches, vacuum tubes) or in punch cards (allowing repetition).  

In the 1970's the terminal allowed programmers to use a computer by manipulating text.

Bit = `0` or `1` - one bit of infomation
- mapped to DC electrical signals `LOW` and `HIGH`

Binary code = `011100100` - also known as machine code

Byte = 8 bits - one byte can represent the integers from 0 to 255

```
one bit -> 2 numbers (0, 1)
two bits -> 4 numbers (0, 1, 2, 3)
three bits -> 8 numbers (0, 1, ... 7)
...
n bits -> 2^n numbers
```

We can represent binary in different forms.  For the decimal `999999`, the binary representation is `11110100001000111111`, and in hexadecimal `F423F`

Computers think in base 2 (one bit has two states)
- we group in base 10 (10 things at a time - can you guess why?)
- computers group things in 2 (2 things at a time)
- having memory (RAM & storage) in sizes like 1024 MB is so that the computer can use it efficiently
- often see powers of 2 in programs (32, 64 etc)


We can use sequences of bits to represent actions we want the CPU to do (these are CPU instructions)
- copy bytes
- add, multiplication
- bit logic - NOT, AND, OR, XOR
- jumps - branching etc


## Assembly

Binary is what a CPU fundamentally understands - but programming directly in binary is inefficient

Assembly to the rescue!

- assemble code from assembly into binary
- **one to one mapping between instruction & binary (`ADD` -> `01110011`)**
- processor specific

Hello World on Intel x86-64 - [programming-resources/fundamentals/hello.s](https://github.com/ADGEfficiency/programming-resources/tree/master/fundamentals)

- compile the source assembly code into binary
- link with system libraries to produce an executable (this can sometimes happen dynamically at runtime)

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


# High level languages

Summary so far - we have learnt that
- CPU understands binary (`0111011`) instructions
- assembly = human readable, one to one mapping to CPU instructions
- assembler = translator

Assembly gives us a lot - but we want more

- use & write reusable, optimized, tested abstractions
- write faster
- write on many different kinds of CPU (portability)
- use libraries (standard library, third party)

**We want a higher level language**

- but our CPU only understands binary
- **what we want is a compiler** - to translate our high level language into assembly


## Compilers

A compiler is used to 
- translate high level programs into machine code
- **not a one to one mapping of code to CPU instructions**

After compilation we get an executable
- the complier can produce optimized code (using instruction level parallelism)
- complied programs are fast

Examples of compiled languages are C, C++ and Rust - that are fast, and give the programmer low level control of memory management

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

An interpreter can be used to
- examine a program one piece at a time
- generates & executes machine language one piece at a time

A program that directly executes code
- no requirement for compilation, no executable produced
- just runs
- examples include Lisp, Python

**Interpreters allow interactive programming**
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

Many languages mix compilation and interpretation together
1. compile
2. interpret
3. compile then run in VM


# Summary

Assembler
- translates assembly -> machine code
- one to one mapping

Compiler
- translates high level -> machine code
- complex abstractions

Interpreter
- executes high level code one instruction at a time, during execution
- high level -> byte code `.pyc`

Transpiler
- converts from one high level language to another
- common in Javascript - transpile Typescript to Javascript


# References

[Hardware Basics - Brian Will](https://www.youtube.com/watch?v=9-KUm9YpPm0)

[How Operating Systems Work: 10 Concepts you Should Know as a Developer
](https://medium.com/cracking-the-data-science-interview/how-operating-systems-work-10-concepts-you-should-know-as-a-developer-8d63bb38331f)

[Hackers & Painters: Big Ideas from the Computer Age](https://en.wikipedia.org/wiki/Hackers_%26_Painters)

[Alex Gaynor: Fast Python, Slow Python - PyCon 2014](https://www.youtube.com/watch?v=7eeEf_rAJds)

[Machine Learning. Literally.](http://www.trivialorwrong.com/2016/06/08/machine-learning-literally.html)


# Further reading

[What Your Computer Does While You Wait](https://manybutfinite.com/post/what-your-computer-does-while-you-wait/)


[What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

[John Carmack on Parallel Implementations](http://sevangelatos.com/john-carmack-on-parallel-implementations/)

[Code fearlessly](http://cam.ly/blog/2010/12/code-fearlessly/)

[Justin Abrahms: Computer science fundamentals for self-taught programmers - PyCon 2014](https://www.youtube.com/watch?v=nEquiifH33w)

[Building Software Systems At Google and Lessons Learned - Jeff Dean](https://www.youtube.com/watch?v=modXC5IWTJI)

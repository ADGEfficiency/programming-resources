## The Unix Philosophy

https://en.wikipedia.org/wiki/Unix_philosophy

Unix philosophy is as important as Unix itself - it is a set cultural of norms for developing software

Originated by Ken Thompson (implemented the original Unix system)

## Minimalist, modular software development

> Many UNIX programs do quite trivial things in isolation, but, combined with other programs, become general and useful tools - The UNIX Programming Environment, Brian Kernighan and Rob Pike (1984)

Write programs that
- do one thing and do it well
- work together
- handle text streams, because that is a universal interface
- are easy to write, test and run

Programs that are
- simple
- short
- clear
- modular
- extensible
- reusable
 
The UNIX toolset is about using programs in combination to get a job done, rather than monolithic, self sufficient, special or one time programs

## Everything is a (text) file

https://en.wikipedia.org/wiki/Everything_is_a_file

Directories, hard drives, modems, keyboards are all simple streams of bytes.  Getting used to the idea that everything is a text file is a crucial first step in feeling comfortable on a UNIX environment. 

## Eric Raymond's 17 Unix Rules

1. Build modular programs
2. Write readable programs
3. Use composition
4. Separate mechanisms from policy
5. Write simple programs
6. Write small programs
7. Write transparent programs
8. Write robust programs
9. Make data complicated when required, not the program
10. Build on potential users' expected knowledge
11. Avoid unnecessary output
12. Write programs which fail in a way that is easy to diagnose
13. Value developer time over machine time
14. Write abstract programs that generate code instead of writing code by hand
15. Prototype software before polishing it
16. Write flexible and open programs
17. Make the program and protocols extensible

## Mike Gancarz: The UNIX Philosophy

- Small is beautiful
- Make each program do one thing well
- Build a prototype as soon as possible
- Choose portability over efficiency
- Store data in flat text files
- Use software leverage to your advantage
- Use shell scripts to increase leverage and portability
- Avoid captive user interfaces
- Make every program a filter

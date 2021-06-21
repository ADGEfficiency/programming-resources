# Fundamentals of Computing & Programming

Introductory course on how computers work, how to write computer programs and what tools you need.

The course is for beginners - it is organized into three sections:

- [fundamentals/computers.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/computers.md)
- [fundamentals/programming.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/programming.md)
- [fundamentals/tools.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/tools.md)

![](assets/1883-Böcklin-Die-Toteninsel.jpg)

<i>Die Toteninsel - Arnold Böcklin - 1883</i>


## Hello World Programs

To demonstrate the difference between assembly, compilation & interpretation (used in [computers.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/computers.md) - tested on a Mac x86 architecture).

### Assembly

```bash
$ brew install nasm
$ nasm -version
$ nasm -f macho64 hello.s
$ ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o
$ ./hello
```

### C

```bash
$ gcc -o hello hello.c
$ ./hello
```

### Python

```bash
$ sudo chmod +x hello.py
$ ./hello.py
```

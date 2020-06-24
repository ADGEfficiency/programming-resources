# Fundamentals of Computing & Programming

Introductory course on how computers work, how to write programs and what tools you need.

![](assets/1883-Böcklin-Die-Toteninsel.jpg)

*Die Toteninsel - Arnold Böcklin - 1883*

- [programming-resources/fundamentals/computers.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/computers.md)
- [programming-resources/fundamentals/programming.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/programming.md)
- [teaching-monolith/misc/tools.ipynb](https://github.com/ADGEfficiency/teaching-monolith/blob/master/misc/tools.ipyn://github.com/ADGEfficiency/teaching-monolith/blob/master/misc/tools.ipynb)


## Hello World Programs

All tested on a Mac (x86)

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
./hello
```

### Python

```bash
$ sudo chmod +x hello.py
$ python hello.py
```

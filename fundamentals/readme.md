# Fundamentals of Computing & Programming

[computers.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/computers.md)

[programming.md](https://github.com/ADGEfficiency/programming-resources/blob/master/fundamentals/programming.md)

## Hello World 

### Assembly

[How to write an assembly ‘hello world’ on macOS](https://jameshfisher.com/2017/02/20/macos-assembly-hello-world/)

Intel x86-64

```bash
$ brew install nasm
$ nasm -version
$ nasm -f macho64 hello.s
$ ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o
$ ./hello
```

### C

Tested on a Mac

```bash
$ gcc -o hello hello.c
./hello
```

### Python

```bash
$ sudo chmod +x hello.py
./hello.py
```

---

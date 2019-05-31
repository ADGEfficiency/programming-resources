## Resources

[What Your Computer Does While You Wait](https://manybutfinite.com/post/what-your-computer-does-while-you-wait/)

[What Every Programmer Should Know About Memory](https://akkadia.org/drepper/cpumemory.pdf)

[What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

## TODO

CPU, RAM, GPU, storage

Threads vs processs

## Bits & bytes

bit = 0 or 1

one bit -> 2 numbers (0, 1)
two bits -> 4 numbers (0, 1, 2, 3)
three bits -> 8 numbers (0, 1, ... 7)
...
n bits -> 2^n numbers

one byte = 8 bits -> (0-255)

Computers think in base 2 (one bit has two states), so computers group things in 2.
- we like to think in base 10 (ie 10 things at a time)

Having RAM in sizes like 1024 MB is so that the computer can use it efficiently

## Float 32 vs 64

float32 is a 32 bit number - float64 uses 64 bits.That means that float64’s take up twice as much memory - and doing operations on them may be a lot slower in some machine architectures.However, float64’s can represent numbers much more accurately than 32 bit floats.They also allow much larger numbers to be stored.

## Text encoding

ASCII code for printable characters has been surpassed by UTF 8, which includes ASCII as a subset, and HTML, the code used for websites, has two different color codes in use: HEX code and RGB triplets, for example.

## Compiled versus interpreted

Interpreted (not compiled) = interactive

No compile time type

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

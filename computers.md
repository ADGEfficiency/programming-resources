CPU, RAM, GPU, storage

Front verus back end

threads vs process

## why powers of 2

We like to think in base 10 (ie 10 things at a time).  

Computers think in base 2 (one bit has two states), so computers group things in 2.  

Having RAM in sizes like 1024 MB is so that the computer can use it efficiently

## float 32 vs 64

float32 is a 32 bit number - float64 uses 64 bits.That means that float64’s take up twice as much memory - and doing operations on them may be a lot slower in some machine architectures.However, float64’s can represent numbers much more accurately than 32 bit floats.They also allow much larger numbers to be stored.


## Compiled vs interpreted

Interpreted (not compiled) = interactive

No compile time type

Scripting
- Perl, Bash, Javascript, Ruby, Python
- not a heavy type system

## port socket

I am assuming you are referring to logical uses. A port is a logical connection method two end points communicate with. Ports operate at the Transport layer of the OSI. For example a VPN client connects to a VPN server over Port 1723. A socket is one end point of a connection. Sockets are a means of plugging the application layer in. Sockets are determined by an IP address and port number. For example, for a VPN client to connect the client would need to use the socket determined by the port number and IP of the local client.

## Unix vs Not Unix

Mac & Linux vs Windows

## Unix

Most things are text files

Terminal runs processes

Server is just another computer

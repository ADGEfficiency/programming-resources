[How SSH port became 22](https://www.ssh.com/ssh/port)(

## TCP

Protocol for delivering streams of bytes between applications running on hosts, via an IP network

- connection oriented - connection must be established (passive open) for requests before a connection is established.

[Understanding how Facebook disappeared from the Internet](https://blog.cloudflare.com/october-2021-facebook-outage/)

[Falsehoods programmers believe about TCP : r/programming](https://www.reddit.com/r/programming/comments/1fgt4en/falsehoods_programmers_believe_about_tcp/?share_id=I23Eqoc5DSB_Z1sVHGAb9&utm_name=androidcss)

---

Network engineer here. Generally, in modern terminology, a packet is an IP packet Aand in networking that is more specifically what it means. Some data payload encapsulated in an IP header. Althought packet is used more loosely as pointed out above (generically).

IP is layer 3 and TCP is at layer 4. Both layers are independent of each other (although these days, it's almost always the ip/tcp stack). But back in the day, TCP could ride over any layer 3 protocol, not necessarily IP. And IP can carry any layer 4 protocol, not just tcp and udp. This is mostly control plane traffic, but take OSPF for example. It uses IP, but neither tcp or udp. 

---

Mostly programmers just need to know
- your request might fail
- your request might not get a response
- ordering is not guaranteed

---

One of the things that’s not true anymore is that TCP would be the dominant protocol. For large scale services, depending on the country and profile of the service it is a matrix of: IPv4, IPv6, TCP and UDP (QUIC/HTTP3). For several large services that I know of HTTP/3 over IPv6 has the largest share already.

It’s not even that TCP has a lot of hidden assumptions - but that you also have IPv6, and QUIC entering the constellation with several important implications. (Or to put it the other way around: one falsehood is that as a programmer you only need to know about TCP)

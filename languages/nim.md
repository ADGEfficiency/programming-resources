[Fast high-level programming languages](https://lh3.github.io/2020/05/17/fast-high-level-programming-languages)

Nim reached its maturity in September 2019. Its syntax is similar to python on the surface, which is a plus. It is relatively easier to get descent performance out of Nim. I have probably spent least time on learning Nim but I can write programs faster than in Julia.

On the down side, writing Nim programs feels a little like writing Perl in that I need to pay extra attention to reference vs value. For the second task, my initial implementation was several times slower than the Javascript one, which is unexpected. Even in the current program, I still don’t understand why the performance get much worse if I change by-reference to by-value in one instance. Nim supporters advised me to run a profiler. I am not sure biologists would enjoy that.

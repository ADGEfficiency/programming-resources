# George Hotz - What is Programming

Notes from a George Hotz talk on programming.

Input → computation → output. A computer = processor + RAM, and instructions and data are the same thing in RAM. Use `objdump` to see a program.

**Program structure**:
- Text (instructions)
- BSS (static data)
- Stack
- Heap (`malloc`)

## What does a software engineer do?

- You never really need to write algorithms (sort, binary tree, etc.)
- The job is to translate business requirements → code
- Mostly web apps, CRUD apps, front end
- Critical of frameworks (Ruby, React) - too heavy

## What is hacking?

What input to the system will achieve my desired outcome?

**Pure vs impure functions**: impure functions have no bounds on their range.

**Process**:
- Understand the system
- Modify the system
- Ship the new system (tests, deploy)

Recommends implementing papers - repeat until you have the skills.

Funnels (customer acquisition). Capitalism is based around consent. High value, low volume vs low value, high volume.

## Dynamic programming

- Use previous outputs
- Define f(x) by f(x+1) (bootstrap)

Sorting:
- Bubble sort = n²
- Tree-based sorts = log n, n log n
- Binary search (find something in a sorted list)
- Merge sort

## Object-level vs meta-level skills

- Object-level skills die when the tool dies
- Meta-level skills don't die (they come from nature, or from people)
- Nature = good: physics versus celebrity gossip
- What is data science? Statistics versus tooling at company X (nature versus people)

**Build a knowledge tree**: new information should fit into the tree (interpolation & connection).

CEO = telling a story - a competition of stories. Read Turing's paper.

Shows a memory leak (does a `malloc` in a loop, then puts the `free` in). GC finds unreachable pointers.

<!-- vim-markdown-toc GFM -->

    * [Tradeoffs](#tradeoffs)
    * [Pick the Right Tool](#pick-the-right-tool)
    * [Writing Code](#writing-code)
        * [Egoless programming](#egoless-programming)
        * [Read](#read)
        * [Write](#write)
        * [Teach.](#teach)
        * [Documentation](#documentation)
    * [Create](#create)
    * [When to Start Coding](#when-to-start-coding)
    * [Writing Good Code](#writing-good-code)
        * [simplicity](#simplicity)
        * [Tests](#tests)
        * [State](#state)
        * [errors](#errors)
        * [be paranoid](#be-paranoid)
    * [Iterating](#iterating)
    * [Perfection](#perfection)
        * [Tension between learning through doing or planning](#tension-between-learning-through-doing-or-planning)
    * [Maintenance](#maintenance)
    * [Design](#design)
* [working with others](#working-with-others)
    * [criticism](#criticism)
    * [Seniority](#seniority)
    * [PR Reviews](#pr-reviews)
* [Applications / Product / Domains / Business](#applications--product--domains--business)
    * [Picking/choosing what to work on](#pickingchoosing-what-to-work-on)
    * [who to write code for](#who-to-write-code-for)
    * [Business](#business)
    * [Customers](#customers)
    * [Web Development](#web-development)
    * [Data Science](#data-science)

<!-- vim-markdown-toc -->
---
This blog post summarizes X blog posts written by programmers about lessons they have learnt.  It's a lesson of lessons post.

References are included for each section, with a full list of references at the end.

quote from bismark - learn from others

## Tradeoffs

learn to view most decisions as tradeoffs - https://nemil.com/on-software-engineering/

Most engineering decisions are not good versus bad choices - they are balances of tradeoffs.

Commonly no one solution to a problem has no downsides - every solution has a number of upsides and downsides.

Framing decisions as trade offs makes clear the relationship between solutions.

A useful framework for analyzing a solution is: - https://nemil.com/on-software-engineering/

- Note the advantages,
- Note the disadvantages,
- Describe a context where the solutions works,
- Note key areas of uncertainty.

UX, security and performance often fight against each other - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

References:

https://nemil.com/on-software-engineering/
- [Think in Tradeoffs](https://nemil.com/2019/06/30/think-in-tradeoffs/)
- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c https://news.ycombinator.com/item?id=30763516

## Pick the Right Tool

Strive for smaller system - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Dependencies are a tradeoff - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Code is bad  - https://nemil.com/on-software-engineering/
- requires maintenance
- leads to bugs

favour stable over state of the art - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

not invented here bias - https://nemil.com/on-software-engineering/

It's free code, but comes with their opinions & hygiene attached - https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/

Best code is no-code, or code you don't maintain. - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Value old technology (sharks). - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

don't reinvent the wheel - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

- https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312
- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
- https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

## Writing Code

### Egoless programming

Keep ego & identity out of code - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
- [The Importance of Humility in Software Development](https://humbletoolsmith.com/2020/08/10/the-importance-of-humility-in-software-development/)

### Read

Read code of libraries you depend on - https://nemil.com/on-software-engineering/

Take care copy and pasting - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

- https://nemil.com/on-software-engineering/


### Write

Write papers.  Writing for an audience that has zero context on what you are doing will force you to examine and clarify your assumptions. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

References:
- [Advice That Actually Worked For Me](https://nabeelqu.co/advice)
- https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html
- https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/
- https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

### Teach.

teach - documentation is teaching - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

References
- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
- https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375

### Documentation

Great code is documented - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

don't comment the obvious stuff (maybe better in documentation) - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

[The Myth of Self-Documenting Code • Buttondown](https://buttondown.email/hillelwayne/archive/the-myth-of-self-documenting-code/)

document - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html

TODO add the different views from programming fundamentals

## Create

## When to Start Coding

use toy problems - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

understand first - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

Don't start coding until you fully understand the problem - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

HN Fully understanding requires attempting to code a solution - https://news.ycombinator.com/item?id=30763516

```
https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

6. Sometimes you have to stop sharpening the saw, and just start cutting shit

Some people tend to jump into problems and just start writing code. Other people tend to want to research and research and get caught in analysis paralysis. In those cases, set a deadline for yourself and just start exploring solutions. You’ll quickly learn more as you start solving the problem, and that will lead you to iterate into a better solution.
```

think before coding (tension) - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

## Writing Good Code

favour reability over cleverness - https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d

write less code - more code = more bugs - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

write for humans - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

You should write code for junior engineers - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Avoid inheritance, overriding and implicit smartness.  https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Use pure functions. https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

favour reability over cleverness

### simplicity

simplicity - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

### Tests

use toy problems

### State

don't share state - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312


- 42 things I learned from building a production database

Use pure functions.

Soft versus hard interfaces - https://nemil.com/on-software-engineering/

- [Pierce the Abstraction Wall](https://nemil.com/2019/07/30/pierce-the-abstraction-wall/) - soft versus hard interfaces

You should write code for junior engineers.

Don't write smart code because you won't be able to debug it.

write less code - more code = more bugs



Don't try to be perfect - Worry less about elegance and perfection; instead strive for continuous improvement and creating a livable system that your team enjoys working in and sustainably delivers value.

Strive for smaller system.

### errors

10% of code causes 90% of bugs. - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

### be paranoid

be skeptical - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

always suspect bugs - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

assume that there are bugs -https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

You should be able to detect problems in your service before your customer does - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Write and handle good errors - 
https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

welocme errors, handle them well - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

Fail early and recover from errors - 
https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Avoid using real-time for correctness guarantees - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

## Iterating

Fast iteration can make up for a lot; it’s usually ok to be wrong if you iterate quickly. Plans should be measured in decades, execution should be measured in weeks.

Be conservative on APIs and liberal with implementations.  Plan to iterate at least three implementations. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Sturgeon’s law applies to your work as well. Don’t linger on one project forever. Make new things. That’s the only way to learn.

## Perfection

Don't try to be perfect - Worry less about elegance and perfection; instead strive for continuous improvement and creating a livable system that your team enjoys working in and sustainably delivers value. - 
https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

### Tension between learning through doing or planning

Don't start coding until you fully understand the problem. HN Fully understanding requires attempting to code a solution.

6. Sometimes you have to stop sharpening the saw, and just start cutting shit

Some people tend to jump into problems and just start writing code. Other people tend to want to research and research and get caught in analysis paralysis. In those cases, set a deadline for yourself and just start exploring solutions. You’ll quickly learn more as you start solving the problem, and that will lead you to iterate into a better solution.

plan before writing code - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

but don't plan too much - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312


## Maintenance

remove bad code - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html


Code has a lifecycle - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Tech debt is occasionally acceptable, but can be fatal - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Anything that can’t be measured easily (e.g., consistency) is often forgotten; pay particular attention to attributes that are difficult to measure. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

three components make up monitoring - logging, metrics, and alarms - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html

## Design

favour stable over state of the art

Encourage rough prototyping in the critical path of binding to a design. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

UX, security and performance often fight against each other.

Features come in four categories - core, necessary, added value and unique selling points - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Value old technology (sharks).

objective criticism

design for maintenance - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html

Socalize task estimates. -https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Socalize design. Design as team, implement as individual. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Road map (plans) are means, not ends - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

design - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html
    How will local development work?
    How will we package and deploy?
    How will we do end-to-end testing?
    How will we stress-test this new service?
    How will we manage secrets?
    CI/CD integration?




# working with others

Give ownership. - 
https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Communication is important (NA).

communication harder than technical - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

Don’t go it alone.

take breaks

Have fun.

Create a culture where ICs are constantly thinking about radically different designs. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Fuck ups happen. Nobody is to blame even when somebody is responsible. Use it as an opportunity to see where the process didn’t work. And if you don’t have a process—well, that’s what’s wrong. Right? - https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/

Prefer structured communications tools like an in-house blog, a wiki, Basecamp, Notion, or GitHub over unstructured messaging platforms like email or Slack. Your work has structure; so should your communications.

Give ownership.

Interviews don't work.

audacious ideas motivate people.

Long-term orientation is in short supply


Sharing is important - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

References
- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

## criticism

objective criticism - https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375

## Seniority

Seniority not just aobut programming

curse of knowledge - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

## PR Reviews

Your response as a diff writer to someone pointing out a problem with a diff should be gratitude, not dismay. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Good enough in PR reviews - https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/

keep PRs to single feature - https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d


Be OK with long PR reviews. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

# Applications / Product / Domains / Business

## Picking/choosing what to work on

Take on big projects. Get uncomfortable. - https://archive.jlongster.com/How-I-Became-Better-Programmer

take breaks - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

Sturgeon’s law applies to your work as well. Don’t linger on one project forever. Make new things. That’s the only way to learn. - https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/

Don't solve problems that don't exist - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Develop Your Personal Brand

Have personal projects - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Take on big projects. Get uncomfortable.

Don't solve problems that don't exist.

The hardest part of software is building the right thing - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/ (can talk more about failure demand here)

Concentrate your resources on a small number of high-conviction bets

## who to write code for

User is king - https://nemil.com/on-software-engineering/

Think about the user experienc. - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

think about users - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

business impact - https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd

## Business

business impact

manage expectations - https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd

Innovation isn't important.

Any field with multiple successful competitors is good news. It means that there is demand, which you can tap in by addressing the problem in your way. In a sector with solid margins, this is an opportunity for design innovation to shine.

Any field where all of the other competitors are free services, outdated desktop apps, open-source communities with no revenue, or wannabe startup cults burning through cash is a lethal minefield covered in a cloud of mustard gas.

Never go up against a free service from a multinational. At least, never directly.

## Customers

Customers are the most important thing. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

There is an optimal number and type of customer. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Don't take customer requests at face value.https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

The buyer is quite often wrong. That fact never changes their mind.

Think about the user experience.

customer / tech support is a powerful form of research

## Web Development

A visitor to your site begins by building a map of it in their heads. Because without that internal map, nothing they will ever do on your site will fully make sense to them because it has no context.

Visible context is always preferable to the context that has been shuffled off into a hidey-hole somewhere.

## Data Science

Data most important. - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

working with data should be 80% of the work of visualization. - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

data important - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

visualization is a spectrum from exploratory to explanatory. Exploratory graphics you make for yourself to find new insights in data. Explanatory graphics in contrast communicate some already-known insight to an audience.  - 
https://observablehq.com/@mbostock/10-years-of-open-source-visualization
https://observablehq.com/@mbostock/10-years-of-open-source-visualization

Model performance != business performance - https://blog.acolyer.org/2019/10/07/150-successful-machine-learning-models/

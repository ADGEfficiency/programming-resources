<!-- vim-markdown-toc GFM -->

* [Think in Tradeoffs](#think-in-tradeoffs)
* [Pick the Right Tool](#pick-the-right-tool)
* [Read](#read)
* [Write](#write)
* [Teach](#teach)
* [Document](#document)
* [Be Paranoid](#be-paranoid)
* [Keep It Simple](#keep-it-simple)
* [What To Work On](#what-to-work-on)
* [What to build a business around](#what-to-build-a-business-around)
* [Importance of Customers](#importance-of-customers)
* [Design](#design)
* [Iterate](#iterate)
    * [Perfection](#perfection)
* [When to Start Coding](#when-to-start-coding)
* [Writing Good Code](#writing-good-code)
    * [Who to write code for](#who-to-write-code-for)
    * [Tests](#tests)
    * [State](#state)
    * [errors](#errors)
* [Maintenance](#maintenance)
* [Work Well With Others](#work-well-with-others)
    * [criticism](#criticism)
    * [Seniority](#seniority)
    * [PR Reviews](#pr-reviews)
* [Web Development Advice](#web-development-advice)
* [Data Science Advice](#data-science-advice)

<!-- vim-markdown-toc -->
---
This blog post summarizes X blog posts written by programmers about lessons they have learnt.  It's a lesson of lessons post.

References are included for each section, with a full list of references at the end.

quote from bismark - learn from others

## Think in Tradeoffs
[[kindle/Mckeown-Essentialism]]

These problems also didn’t have true or false answers, only better or worse solutions.

As economist Thomas Sowell wrote: “There are no solutions. There are only trade-offs.”7 Jim Collins, — location: [589](kindle://book?action=open&asin=B00HELB6XI&location=589) ^ref-16676

Most engineering decisions are not good versus bad choices - they are balances of tradeoffs. A solution to a problem always has both upsides and downsides.

An example is made by [Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c), who highlights UX, security and performance often fight against each other..

[Nemil Dalal](https://nemil.com/on-software-engineering) offers a framework for analyzing a solution is:

- Note the advantages,
- Note the disadvantages,
- Describe a context where the solutions works,
- Note key areas of uncertainty.

References:

- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
- [Think in Tradeoffs](https://nemil.com/2019/06/30/think-in-tradeoffs/)
- https://nemil.com/on-software-engineering

## Pick the Right Tool

A great example of tradeoff is choosing what tools to work with.

Choosing what tools you depend on is full of tradeoffs.

[Daniel Bourke](https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195) and  
[Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c) and 
[Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer) all suggest favouring stable, older tools over state of the art, hype-driven tools.

Code itself is a tool with downside - [Nemil Dalal](https://nemil.com/on-software-engineering) notes that code requires maintenance and leads to bugs.

[Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer) notes that best code is no-code, or code you don't maintain.

Relying on code you don't maintain is however (you guessed it) a dependency.

Closely related to choosing tools is choosing dependencies.  

Choosing whether to build something yourself or use someone elses solution i a tradeoff.

Dependencies can save time, but they also come with their own opinions and hygiene attached.

[Nemil Dalal](https://nemil.com/on-software-engineering) suggests strive for smaller system. 

Both [Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312) and [Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c) suggest to not reinvent the wheel - avoiding the 'not invented here bias' that many proggrammers fall foul of.

## Read

Programming is not only about writing code - it's also about reading code.

[Nemil Dalal](https://nemil.com/on-software-engineering) suggests to read code of libraries you depend on.

## Write

[Nabeel S. Qureshi](https://nabeelqu.co/advice), [Mahesh Balakrishnan](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html) and [Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer) all suggest to write.

[Mahesh Balakrishnan](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html) suggests to write for an audience that has zero context on what you are doing will force you to examine and clarify your assumptions. 

## Teach

[Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c), [Aphinya Dechalert](https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375) and [Mike Bostock](https://observablehq.com/@mbostock/10-years-of-open-source-visualization) all advorate for teaching.

[Mike Bostock](https://observablehq.com/@mbostock/10-years-of-open-source-visualization) lists teaching as the most important aspect of building tools.

## Document

Both [Neil Kakkar](https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html) and [Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c) suggest great code is documented.

Documentation is one of the most contraversial topics in programming.

A key problem with documentation is the possibility of inconsistency - documentation can sometimes lie.

don't comment the obvious stuff (maybe better in documentation) - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

Many programmers think code should be self-documenting - that the code itself is written in a way that it's understandable without external documentation. [Hillel Wayne](https://buttondown.email/hillelwayne/archive/the-myth-of-self-documenting-code/) disagrees with this.

## Be Paranoid

Many programmers advise a healthy degree of skepticism and paranoia.

Both [Rafael Quintanilha](https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/) and [Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312) suggest to assume there are always bugs.

You should be able to detect problems in your service before your customer does - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

[Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c) and [Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312) both suggest that we should welcome errors, fail early and handle errors well. 


## Keep It Simple

simplicity - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

## What To Work On

The trick is to recognise when it’s time to move on. (NA) - https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/

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

## What to build a business around

business impact

manage expectations - https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd

Innovation isn't important.

Any field with multiple successful competitors is good news. It means that there is demand, which you can tap in by addressing the problem in your way. In a sector with solid margins, this is an opportunity for design innovation to shine.

Any field where all of the other competitors are free services, outdated desktop apps, open-source communities with no revenue, or wannabe startup cults burning through cash is a lethal minefield covered in a cloud of mustard gas.

Never go up against a free service from a multinational. At least, never directly.

## Importance of Customers

Customers are the most important thing. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

There is an optimal number and type of customer. https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Don't take customer requests at face value.https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

The buyer is quite often wrong. That fact never changes their mind.

Think about the user experience.

customer / tech support is a powerful form of research

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



## Iterate

Fast iteration can make up for a lot; it’s usually ok to be wrong if you iterate quickly. Plans should be measured in decades, execution should be measured in weeks.

Be conservative on APIs and liberal with implementations.  Plan to iterate at least three implementations. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Sturgeon’s law applies to your work as well. Don’t linger on one project forever. Make new things. That’s the only way to learn.

### Perfection

Don't try to be perfect - Worry less about elegance and perfection; instead strive for continuous improvement and creating a livable system that your team enjoys working in and sustainably delivers value. - 
https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

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

Don't start coding until you fully understand the problem. HN Fully understanding requires attempting to code a solution.

6. Sometimes you have to stop sharpening the saw, and just start cutting shit

Some people tend to jump into problems and just start writing code. Other people tend to want to research and research and get caught in analysis paralysis. In those cases, set a deadline for yourself and just start exploring solutions. You’ll quickly learn more as you start solving the problem, and that will lead you to iterate into a better solution.

plan before writing code - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

but don't plan too much - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312


## Writing Good Code

favour reability over cleverness - https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d

write less code - more code = more bugs - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

write for humans - https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

You should write code for junior engineers - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Avoid inheritance, overriding and implicit smartness.  https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Use pure functions. https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

### Who to write code for

Not yourself - Keep ego & identity out of code - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

- https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
- [The Importance of Humility in Software Development](https://humbletoolsmith.com/2020/08/10/the-importance-of-humility-in-software-development/)

favour reability over cleverness

User is king - https://nemil.com/on-software-engineering/

Think about the user experienc. - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

think about users - https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

business impact - https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd


### Tests

Avoid using real-time for correctness guarantees - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

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

## Maintenance

remove bad code - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html


Code has a lifecycle - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Tech debt is occasionally acceptable, but can be fatal - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Anything that can’t be measured easily (e.g., consistency) is often forgotten; pay particular attention to attributes that are difficult to measure. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

three components make up monitoring - logging, metrics, and alarms - https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html

## Work Well With Others

Don’t go it alone. - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

Don’t mistake humility for ignorance. - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Deprecate yourself. - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

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

### criticism

objective criticism - https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375

### Seniority

Seniority not just aobut programming

curse of knowledge - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

### PR Reviews

Your response as a diff writer to someone pointing out a problem with a diff should be gratitude, not dismay. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Good enough in PR reviews - https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/

keep PRs to single feature - https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d

Be OK with long PR reviews. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

## Web Development Advice

A visitor to your site begins by building a map of it in their heads. Because without that internal map, nothing they will ever do on your site will fully make sense to them because it has no context.

Visible context is always preferable to the context that has been shuffled off into a hidey-hole somewhere.

## Data Science Advice

Data most important. - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

working with data should be 80% of the work of visualization. - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

data important - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

visualization is a spectrum from exploratory to explanatory. Exploratory graphics you make for yourself to find new insights in data. Explanatory graphics in contrast communicate some already-known insight to an audience.  - 
https://observablehq.com/@mbostock/10-years-of-open-source-visualization
https://observablehq.com/@mbostock/10-years-of-open-source-visualization

Model performance != business performance - https://blog.acolyer.org/2019/10/07/150-successful-machine-learning-models/

---

[Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c)

[Nemil Dalal](https://nemil.com/on-software-engineering)

[Daniel Bourke](https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195)

[Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer)

[Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312)

[Aphinya Dechalert](https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375)

[Mike Bostock](https://observablehq.com/@mbostock/10-years-of-open-source-visualization)

[Rafael Quintanilha](https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/)

[Neil Kakkar](https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html)

[Hillel Wayne](https://buttondown.email/hillelwayne/archive/the-myth-of-self-documenting-code/)

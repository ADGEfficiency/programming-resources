<!-- vim-markdown-toc GFM -->

* [Business](#business)
    * [What to build a business around](#what-to-build-a-business-around)
    * [Importance of Customers](#importance-of-customers)
* [Technology](#technology)
    * [When to Start Coding](#when-to-start-coding)
    * [Source Control](#source-control)
    * [Writing Good Code](#writing-good-code)
        * [Who to write code for](#who-to-write-code-for)
        * [Tests](#tests)
        * [State](#state)
        * [errors](#errors)
    * [Maintenance](#maintenance)
    * [Monitoring](#monitoring)
* [People](#people)
    * [design](#design)
    * [Work Well With Others](#work-well-with-others)
        * [criticism](#criticism)
        * [Seniority](#seniority)
        * [PR Reviews](#pr-reviews)
* [Domain Specific Advice](#domain-specific-advice)
    * [Web Development Advice](#web-development-advice)
    * [Data Science Advice](#data-science-advice)

<!-- vim-markdown-toc -->

---

# Business

## What to build a business around

[Baldur Bjarnason](https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/)

Most ‘innovative’ tech startups face what I like to call ‘the clear field problem’. Whenever you have an app or business idea that nobody else seems to have done successfully before, it’s never because you are particularly clever or original. It’s always because everybody else who has tried is now dead in a ditch somewhere (metaphorically speaking).

Innovation isn't important.

Any field with multiple successful competitors is good news. It means that there is demand, which you can tap in by addressing the problem in your way. In a sector with solid margins, this is an opportunity for design innovation to shine.

Any field where all of the other competitors are free services, outdated desktop apps, open-source communities with no revenue, or wannabe startup cults burning through cash is a lethal minefield covered in a cloud of mustard gas.

Never go up against a free service from a multinational. At least, never directly.

## Importance of Customers

[Mahesh Balakrishnan](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html)

Customers are the most important thing. 

There is an optimal number and type of customer. 

Don't take customer requests at face value.

The buyer is quite often wrong. That fact never changes their mind.

Think about the user experience.

customer / tech support is a powerful form of research

# Technology

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

## Source Control

[lockedInSpace](https://www.lockedinspace.com/posts/001.html) Git should be your only source of truth. Discard any local files or changes, what's not pushed into the repository, does not exist.

[Brandon Willet](https://www.willett.io/posts/precepts/) Use Git. Use it for everything – infrastructure, configuration, code, dashboards, on-call rotations. Your git repository is your point-in-time-recoverable source of truth.


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

/Users/adam/personal/para/project/teaching-monolith.md - see the testing stuff in here, for the different approaches


[Brandon Willet](https://www.willett.io/posts/precepts/) Never give up on local testing. It keeps dev cycle time much shorter than needing to rely on (and fiddle with) CI or remote workspaces. Containerizing the local test environment can make it easier to keep dependencies straight and consistent across machines.


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

## Monitoring

[lockedInSpace](https://www.lockedinspace.com/posts/001.html) A good monitoring system, well-organized repository, fault-tolerance workloads and automation mechanisms are the basis of any architecture.

[Jan Schaumann](https://www.netmeister.org/blog/ops-lessons.html) Bart Simpson writing 'Tar is not a play thing' on the school chalkboard.Email is the worst monitoring and alerting mechanism except for all the others.

# People

## design

[Mahesh Balakrishnan](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html) Socalize task estimates. Socalize design. Design as team, implement as individual. 

## Work Well With Others

Don’t go it alone. - https://observablehq.com/@mbostock/10-years-of-open-source-visualization

Don’t mistake humility for ignorance. - https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Deprecate yourself. - https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c

Give ownership. - 
https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/

Communication is important (NA).

communication harder than technical - https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

[Tom at CodeBuildRepeat](https://codebuildrepeat.blogspot.com/2020/03/my-first-year-as-data-scientist.html) - presentations should be aimed at your audience - there are four audience types - devs, stakeholders, other departments and external.

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

[lockedInSpace](https://www.lockedinspace.com/posts/001.html) - When bad things happen, remember that a wider view is your best ally. (spread blame)

[Jan Schaumann](https://www.netmeister.org/blog/ops-lessons.html) If you determine "human error" as the root cause, then you're doing it wrong.

### Seniority

Seniority not just aobut programming

curse of knowledge - https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

### PR Reviews

Your response as a diff writer to someone pointing out a problem with a diff should be gratitude, not dismay. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Good enough in PR reviews - https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/

keep PRs to single feature - https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d

Be OK with long PR reviews. - https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

# Domain Specific Advice

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

[Tom at CodeBuildRepeat](https://codebuildrepeat.blogspot.com/2020/03/my-first-year-as-data-scientist.html) - use databases instead of flat files.

---

[Alex Ewerlöf](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c)

[Nemil Dalal](https://nemil.com/on-software-engineering) - [Think in Tradeoffs](https://nemil.com/2019/06/30/think-in-tradeoffs/)

[Daniel Bourke](https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195)

[Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer)

[Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312)

[Aphinya Dechalert](https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375)

[Mike Bostock](https://observablehq.com/@mbostock/10-years-of-open-source-visualization)

[Rafael Quintanilha](https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/)

[Neil Kakkar](https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html)

[Hillel Wayne](https://buttondown.email/hillelwayne/archive/the-myth-of-self-documenting-code/)

[Tom at CodeBuildRepeat](https://codebuildrepeat.blogspot.com/2020/03/my-first-year-as-data-scientist.html)

[lockedInSpace](https://www.lockedinspace.com/posts/001.html)

[Brandon Willet](https://www.willett.io/posts/precepts/)

[Jan Schaumann](https://www.netmeister.org/blog/ops-lessons.html)

[Joel Goldberg](https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/)

[Sam Altman](https://blog.samaltman.com/what-i-wish-someone-had-told-me)

[James Long](https://archive.jlongster.com/How-I-Became-Better-Programmer)

[Samer Buna](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312)

[Ned Utzig](https://madned.substack.com/p/an-old-hackers-tips-on-staying-employed)

[Justin Etheredge](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/)

[Mahesh Balakrishnan](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html)

[Baldur Bjarnason](https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/)

https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c
https://news.ycombinator.com/item?id=30763516

NA = not actionable

Use the right tool for the job. (NA)

You should write code for junior engineers.

Communication is important (NA).

Sharing is important.

Deprecate yourself.

Security is layered and context dependent (NA).

UX, security and performance often fight against each other.

Code has a lifecycle.

Features come in four categories - core, necessary, added value and unique selling points.

Keep ego & identity out of code.

Tech debt is occassionally acceptable, but can be fatal.

Take care copy and pasting.

Write good errors.

Fail early and recover from errors.

Don't use dependecies unless it's a good tradeoff (NA).

Teach.

Don't give in to hype.

Have personal projects.

Great code is documented.

Avoid inheritance, overriding and implicit smartness.

Use pure functions.

Don't start coding until you fully understand the problem. HN Fully understanding requires attempting to code a solution.

Don't solve problems that don't exist.

https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html

Customers are the most important thing.

There is an optimal number and type of customer.

Don't take customer requests at face value.

Socalize task esitmates.

Road map (plans) are means, not ends.

Good managers are important (NA).

Be conservative on APIs and liberal with implementations.  Plan to iterate at least three implementations.

Encourage rough prototyping in the critical path of binding to a design.

Socalize design. Design as team, implement as individual.

Create a culture where ICs are constantly thinking about radically different designs.

Have the right number of abstractions (NA)

Avoid using real-time for correctness guarantees.

Your response as a diff writer to someone pointing out a problem with a diff should be gratitude, not dismay.

Be OK with long PR reviews.

You should be able to detect problems in your service before your customer does.

Anything that can’t be measured easily (e.g., consistency) is often forgotten; pay particular attention to attributes that are difficult to measure.

Write papers. Writing for an audience that has zero context on what you are doing will force you to examine and clarify your assumptions.

https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/

There are exceptions to most rules.

Web development becomes more complicated the more you pull it apart and less so the more you step back.

Sturgeon’s law applies to your work as well. Don’t linger on one project forever. Make new things. That’s the only way to learn.

The trick is to recognise when it’s time to move on. (NA)

A visitor to your site begins by building a map of it in their heads. Because without that internal map, nothing they will ever do on your site will fully make sense to them because it has no context.

Visible context is always preferable to the context that has been shuffled off into a hidey-hole somewhere.

The buyer is quite often wrong. That fact never changes their mind.

Fuck ups happen. Nobody is to blame even when somebody is responsible. Use it as an opportunity to see where the process didn’t work. And if you don’t have a process—well, that’s what’s wrong. Right?

Prefer structured communications tools like an in-house blog, a wiki, Basecamp, Notion, or GitHub over unstructured messaging platforms like email or Slack. Your work has structure; so should your communications.

Any field with multiple successful competitors is good news. It means that there is demand, which you can tap in by addressing the problem in your way. In a sector with solid margins, this is an opportunity for design innovation to shine.

Any field where all of the other competitors are free services, outdated desktop apps, open-source communities with no revenue, or wannabe startup cults burning through cash is a lethal minefield covered in a cloud of mustard gas.

Never go up against a free service from a multinational. At least, never directly.

---

https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/
https://news.ycombinator.com/item?id=28797485

The hardest part of software is building the right thing

Think about the user experienc.

Best code is no-code, or code you don't maintain.

```
6. Sometimes you have to stop sharpening the saw, and just start cutting shit

Some people tend to jump into problems and just start writing code. Other people tend to want to research and research and get caught in analysis paralysis. In those cases, set a deadline for yourself and just start exploring solutions. You’ll quickly learn more as you start solving the problem, and that will lead you to iterate into a better solution.
```

Don't try to be perfect - Worry less about elegance and perfection; instead strive for continuous improvement and creating a livable system that your team enjoys working in and sustainably delivers value.

Experience is about becoming opinionated abut tools or approach to building software.

Innovation isn't important.

Data is important.

Value old technology (sharks).

Don’t mistake humility for ignorance.

Write.

Give ownership.

Interviews don't work.

Strive for smaller system.

https://www.rafaelquintanilha.com/how-to-become-a-bad-developer/

always suspect bugs

think before coding (tension)

write less code - more code = more bugs

write for humans

https://observablehq.com/@mbostock/10-years-of-open-source-visualization

teach - documentation is teaching

customer / tech support is a powerful form of research

visualization is a spectrum from exploratory to explanatory. Exploratory graphics you make for yourself to find new insights in data. Explanatory graphics in contrast communicate some already-known insight to an audience. 

working with data should be 80% of the work of visualization.

10% of code causes 90% of bugs.

Don’t go it alone.

Have fun.

https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html

document

remove bad code

design
    How will local development work?
    How will we package and deploy?
    How will we do end-to-end testing?
    How will we stress-test this new service?
    How will we manage secrets?
    CI/CD integration?

design for maintenance

three components make up monitoring - logging, metrics, and alarms

https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375

teach

objective criticism

https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312

plan before writing code

but don't plan too much

don't comment the obvious stuff

assume that there are bugs

think about users

pick right tool

don't reinvent the wheel

don't share state

welocme errors, handle them well

take breaks

https://nemil.com/on-software-engineering/

tradeoffs - not as good versus bad choices

learn to view most decisions as tradeoffs

The tradeoffs framing does four main things for a specific tool or choice:

    Notes the advantages
    Highlights the disadvantages
    Visualizes a context in which the tool makes sense
    Notes key areas of uncertainty (when relevant)

Soft versus hard interfaces

Read code of libraries you depend on

Code is bad
- requires maintenance
- leads to bugs

not invented here bias

Read code

User is king

https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd

business impact

manage expectations

https://erikbern.com/2021/07/07/the-data-team-a-short-story.html TODO

https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/

curse of knowledge

simplicity

understand first

https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195

Data most important

communication harder than technical

favour stable over state of the art

be skeptical

use toy problems

rubber duck

less models from scratch

https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d

favour reability over cleverness

keep PRs to single feature

https://blog.acolyer.org/2019/10/07/150-successful-machine-learning-models/

Model performance != business performance

https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/

Good enough in PR reviews

Some tech debt is ok

Seniority not just aobut programming

https://archive.jlongster.com/How-I-Became-Better-Programmer

Take on big projects. Get uncomfortable.

https://madned.substack.com/p/an-old-hackers-tips-on-staying-employed

Develop Your Personal Brand

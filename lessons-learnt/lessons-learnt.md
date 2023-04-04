[My guiding principles after 20 years of programming](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c) [HN Discussion](https://news.ycombinator.com/item?id=30763516)

```
usrbinbash

> Never start coding (making a solution) unless you fully understand the problem.

While I agree with this in general, I find that to reall fully understand a problem, I need to attempt to code, or at least formulate, a solution to it.

a) because when I break down a problem into its code-able component parts, I learn a lot about it

b) because in the process of then actually implementing these parts I often discover edge cases or undefined cases (especially in naturally grown business-logic)

c) because what the problem actually IS, is often not that clear at the start of the problem. Yes, in an ideal world, changing requirements would wait until the next version, however, sadly that's not what happens in the wild. 

    JKCalhoun 

    Yeah, it could just be me, but I prefer to make two false starts, toss them, and then get it right on the third attempt rather than attempting to whiteboard the problem for two weeks.

    Not only is it more interesting to me to try three different ways to tackle a problem, but I have been burned when the two weeks of whiteboarding missed something and I'm back to having to iterate anyway.

    To be sure, I do a little whiteboarding, but generally it might be about 2 hours or so of sketching out ideas, major structures, code flow ideas.

        Palomides 

        I forget where I read this, but something like:

        first time to understand the problem

        second time to understand the solution

        third time to do it right 

            koide

            The key part here is that you shouldn't be afraid of throwing parts (or even throwing wholes) away. Many times we get too attached to solutions to the wrong problem because that's what we built.
```

[42 things I learned from building a production database](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html)

[136 facts every web dev should know before they burn out and turn to landscape painting or nude modelling](https://www.baldurbjarnason.com/2021/100-things-every-web-developer-should-know/)

https://news.ycombinator.com/item?id=27418296

The difference between a decent developer and a great developer is the latter understand how their work fits into the larger picture. As a result they're able to quickly and effectively pivot to suit the dynamic needs of the business. 

 It's not easy to do things the simple way, being clever is the easy path. Knowing when you need to be clever and when simple is enough is what separates experience from greenhorns. 

[20 Things I’ve Learned in my 20 Years as a Software Engineer](https://www.simplethread.com/20-things-ive-learned-in-my-20-years-as-a-software-engineer/) - [Hacker News discussion](https://news.ycombinator.com/item?id=28797485)

- The benefit of talented engineers comes from the fact that they avoid costly pitfalls - not that they pump out more code per hour worked.

The first one was not a bad person by any means, but had no social skills, no ability to communicate and often just forged ahead building great stuff on his own. Entire areas of the software were entirely conceived and created by him, and it was difficult to even grasp what he was doing while pair programming with him. In a day he would write more tests and get more coverage than the rest of us would create in a week.

The second one had come from a FAANG-ish place where he was extremely successful, but didn't want the money or stress. He was extremely kind, considerate and great at communicating. Pair programming with him was a joy and he helped everyone else on the team grow. I'm confident he could have created entire regions of the software on his own, but he knew that wasn't the right thing to do. He would often ask questions until someone else on the team could solve a problem, even though I'm sure he knew how to solve it easily himself. 

[How to Become a Bad Developer](https://rafaelquintanilha.com/how-to-become-a-bad-developer/) - [Hacker News discussion](https://news.ycombinator.com/item?id=27539342)

[An incomplete list of skills senior engineers need, beyond coding](https://skamille.medium.com/an-incomplete-list-of-skills-senior-engineers-need-beyond-coding-8ed4a521b29f)

[10 Years of Open-Source Visualization](https://observablehq.com/@mbostock/10-years-of-open-source-visualization)

[Things I Learnt from a Senior Software Engineer - Neil Kakkar](https://neilkakkar.com/things-I-learnt-from-a-senior-dev.html)

[The Marks of a True Senior Developer](https://medium.com/madhash/the-marks-of-a-true-senior-developer-d5f3b11c3375)

> “The mediocre teacher tells. The good teacher explains. The superior teacher demonstrates. The great teacher inspires.” — William Arthur Ward

[The Mistakes I Made As a Beginner Programmer](https://medium.com/edge-coders/the-mistakes-i-made-as-a-beginner-programmer-ac8b3e54c312)

[Notes to a Young Software Engineer](https://nemil.com/on-software-engineering/)

- [Think in Tradeoffs](https://nemil.com/2019/06/30/think-in-tradeoffs/) -  most engineering decisions as tradeoffs — not good choices versus bad choices.
- [Pierce the Abstraction Wall](https://nemil.com/2019/07/30/pierce-the-abstraction-wall/) - soft versus hard interfaces
- [Don't Write Code](https://nemil.com/2020/01/10/dont-write-code/)
- [Read Code](https://nemil.com/2019/04/16/read-code/)
- [The User is King (And Not)](https://nemil.com/2020/01/29/the-user-is-king-and-not/)

[The Differences Between a Junior, Mid-Level, and Senior Developer](https://medium.com/better-programming/the-differences-between-a-junior-mid-level-and-senior-developer-bb2cb2eb000d)

[What Separates Good from Great Data Scientists?](https://towardsdatascience.com/what-separates-good-from-great-data-scientists-2906431455fd)

- strong focus on business impact,
- software engineering skills,
- expectation management,
- can use the cloud,

[Building a data team at a mid-stage startup: a short story](https://erikbern.com/2021/07/07/the-data-team-a-short-story.html)

- not aligned on metrics,
- data science work not production ready - not integrated often enough (should be like commits, early + often)
- the most basic foundation of what is most critically needed: all the important data, in the same place, easily queryable
- centralization of the reporting structure, but keeping the work management decentralized - > creates a much tighter feedback loop between data and decisions

```
    Lack of data, and fragmented data
        The product is poorly instrumented so data often doesn't exist in the first place
        A fragmentation of data systems, with data spread out over many different ones
        Brittle business processes driven by data but with little or no automation
    An unclear expectation of what the data team's job is supposed to be
        Data scientists hired to do R&D and figure out some way to deploy AI or whatever — as a result not having any clear business goal
        Data team complaining about it being hard to productionize ML, yet the product team doesn't really seem to care about the feature
        People in need of “English-to-SQL translators”
    A product team not trained to be data driven
        Product managers not thinking about data as a tool for building better features
        A lack of alignment between what product teams want to build versus what data teams have
    A culture that fundamentally is at odds with being data driven
        A culture of celebrating shipping, versus celebrating measurable progress and learnings
        To the extent teams actually use metrics, they are inconsistent, poorly measured, and in some cases at conflict with other teams
    No data leadership
        A fractured data org with various data people reporting into other functional areas
        Other departments not getting the help they need, so they work around the data team and hire lots of analysts
        Lack of standardizations of toolchain and best practice
```

```
The other thing is, note what's happening with the supply chain team. The journey is roughly:

    That team started out with their own “business analysts” (outside the data team) but need the data team to run queries for them to get data
    Those business analysts are starting to run queries themselves with the help of the data team
    They start to build up “shadow tech debt” (in this case monster SQL queries) which first causes a bunch of friction with the data team
    The data team starts embedding into the team and helping them get to a better place
    Because of the embedding, the need for business analysts goes down and data scientists goes up
```


## [What I’ve Learned in 45 Years in the Software Industry](https://www.bti360.com/what-ive-learned-in-45-years-in-the-software-industry/)

- beware the curse of knowledge
- simplicity
- understand, then be understood
- beware of technology lock in


## [12 Things I Learned During My First Year as a Machine Learning Engineer](https://towardsdatascience.com/12-things-i-learned-during-my-first-year-as-a-machine-learning-engineer-2991573a9195)

- It’s always about the data
- Communication problems are harder

Two gaps in ML
- going from course work to project work
- going from a notebook to production

Toy problem first

## [Coding Mistakes I Made As A Junior Developer](https://towardsdatascience.com/coding-mistakes-i-made-as-a-junior-developer-e151dd3b3c7d)

## 150 Successful Machine Learning Models: 6 Lessons Learned at Booking.com - [paper](https://dl.acm.org/doi/pdf/10.1145/3292500.3330744) - [blog post](https://blog.acolyer.org/2019/10/07/150-successful-machine-learning-models/)

Model performance != business performance


## [8-Bits of Advice for New Programmers (The stuff they don't teach you in school!)](https://www.youtube.com/watch?v=vVRCJ52g5m4)

- be realistic - learn variables & arithmetic, sequences, loops, arrays, functions, structures, classes
- right tools
- have fun
- practice
- rewrite - even if you are copying it over


## [7 absolute truths I unlearned as junior developer](https://monicalent.com/blog/2019/06/03/absolute-truths-unlearned-as-junior-developer/)

Not all experience is created equal
- that’s why mentors are so important, and the team you work with is worth so much more than a couple bucks in your paycheck

Loads of companies and startups have little or no tests. 
- no company has a perfect tech setup.
- being overly opinionated on topics you lack real-world experience with is pretty arrogant.
- good enough is good enough.

Documentation lies sometimes.
- focus on automation over documentation where appropriate. 

Disorganized or messy code isn’t the same as technical debt.
- Having some technical debt is healthy
- If you think your codebase is free of technical debt, there is a good chance you’re over-emphasizing polish instead of delivery. And boy did I do that!


## [How I Became a Better Programmer](https://jlongster.com/How-I-Became-Better-Programmer)

If anything, just try a new language - Regardless of what you do, you really should explore other languages. I would recommend any of the following: Clojure, Rust, Elm, OCaml/Reason, Go, or Scheme. All of them have unique features and will force you to learn a new way of thinking.


## [An Old Hacker's Tips On Staying Employed](https://madned.substack.com/p/an-old-hackers-tips-on-staying-employed)

### Personal brand

Importance of a personal brand for job security
- can be independent of the success of the projects you work on

If you were a complete pain-in-the-ass to work with, dropped the ball a lot, said things you were going to do but didn’t do them, then good luck.

### Make your boss afraid

Make yourself indispensable

### Make your boss happy

Make your boss successful

### Do it anyway

Sometimes you need to do grunt or non-glamarous work
- just get it done

> We are all constantly measured in the eyes of our employers by what we actually deliver, and those who can find a way to succeed even in the face of adversity will always have an advantage over those who cannot, or do not want to.

### Two and done

So the Two-And-Done rule was born, wherein I will state my case the first time, and if whoever is arguing to the contrary does not agree after hearing my position, I’ll let it go. 

But the next time the opportunity comes up, I will argue my point again. Maybe allowing for a gap of time for people to consider my original point, or maybe allowing me time to refine and rephrase my ideas to be more convincing.

If I fail to get my way after the second time though, I am done.

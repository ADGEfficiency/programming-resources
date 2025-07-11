[Adventures in Imbalanced Learning and Class Weight | andersource](https://andersource.dev/2025/05/05/imbalanced-learning.html)

I know that class imbalance, in and of itself, does not warrant using class weights. Furthermore, if I deem class weights necessary, instead of using the typical “inverse proportion” scheme, my weights had better be informed by the particular problem characteristics: the nature of the tradeoff curve, label noise, and the cost I assign to each type of error.

---
[Adventures in Imbalanced Learning and Class Weight | Hacker News](https://news.ycombinator.com/item?id=43926029)

Nice writeup. F1, balanced accuracy, etc. In truth it depends on your problem and what a practical "best" solution is, especially in imbalanced scenarios, but Matthews Correlation Coefficient (MCC) is probably the best comprehensive and balanced blind go-to metric, because it guarantees that more portions of the confusion matrix are good.

[Shopify's Data Science & Engineering Foundations](https://shopify.engineering/shopifys-data-science-engineering-foundations)

[Shopify's Data Science and Engineering Foundations (2020) | Hacker News](https://news.ycombinator.com/item?id=30643677)

> It sounds like they have data science and data engineering in one organization. Is that team structure something that others have seen work well?

I've been in orgs where it was on same team, and on different teams, both as a modeler and a data engineer. So far, I personally prefer when they're on the same team.

Pros of same-team: fewer ideas "lost in translation" between data scientists and data engineers, better understanding of which datasets/flows are top priority, can sometimes share some stack components and help datascientists improve their code, better chances of getting data scientists to contribute their own batch jobs (there's just more trust as opposed to dealing with some "engineering" team that is less connected to you)

Cons of same team: data engineers may not be as in-the-loop on what's happening with production datasets, may not be as tightly integrated with a devops team, may get overly caught up in "business logic" as opposed to "plumbing". 


[Taming the Tail: Adventures in Improving AI Economics | Andreessen Horowitz](https://a16z.com/taming-the-tail-adventures-in-improving-ai-economics/)

AI development is a process of experimenting, much like chemistry or physics.

Software development, on the other hand, is a process of building and engineering.

ML is essentially code that creates code (as a function of the input data)… this creates an additional layer of indirection that’s hard to reason about.

---

Long-tailed distributions are also extremely common in machine learning, reflecting the state of the real world and typical data collection practices

Supervised learning models tend to perform well on common inputs (i.e. the head of the distribution) but struggle where examples are sparse (the tail).

The raw cost of data and compute resources. These costs are often far higher for ML than for traditional software, since so much data, so many experiments, and so many parameters are required to achieve accurate results. Anecdotally, development costs – and failure rates – for AI applications can be 3-5x higher than in typical software products.

The long tail can contribute to high variable costs beyond infrastructure.

AI businesses working on long-tailed problems can actually show diseconomies of scale – meaning the economics get worse over time relative to competitors. Data has a cost to collect, process, and maintain. While this cost tends to decrease over time relative to data volume, the marginal benefit of additional data points declines much faster. 

---

Easy mode: Bounded problems

Harder: Global long tail problems

Really hard: Local long tail problems

---

Experienced ML builders shared a more general pattern called componentizing.

The critical design element is that each model addresses a global slice of data – rather than a particular customer, for instance – and that the sub-problems are relatively bounded and easy to reason about. There is no substitute, it turns out, for deep domain expertise.

---

Several strategies can help bring the benefits of global models to local problem spaces.

A near-term, practical option is the meta model pattern, in which a single model is trained to cover a range of customers or tasks. 

---

Build an edge case engine. You can’t address the long tail if you can’t see it. 

Collecting long-tail data in a repeatable way is a critical capability for most ML teams – usually involving identifying out-of-distribution data in production (either with statistical tests or by measuring unusual model behavior), sourcing similar examples, labeling the new data, and intelligently retraining, often using active learning.

[Get Me Out Of Data Hell — Ludicity](https://ludic.mataroa.blog/blog/get-me-out-of-data-hell/)

The author's values fundamentally conflict with the organization's
- Organization values meeting arbitrary deadlines over quality
- Author values tested code, comprehensible logs, and sustainable practices

The specific technical problems are emblematic of deeper organizational issues

[Data Science in Production Best Practices](https://medium.com/bcggamma/data-science-python-best-practices-fdb16fdedf82)

[Good Data Scientist, Bad Data Scientist](https://ianwhitestone.work/good-ds-bad-ds/)

[Oil is the New Data](https://logicmag.io/nature/oil-is-the-new-data/)

Despite the climate crisis that our planet faces, Big Oil is doubling down on fossil fuels. At over 30 billion barrels of crude oil a year, production has never been higher. 

Now, with the help of tech companies like Microsoft, oil companies are using cutting-edge technology to produce even more. 

Big Tech and Big Oil are closely linked, and only getting closer. The foundation of their partnership is the cloud.

This helps explain why cloud providers have only captured about 30 percent of the total addressable market. 

While cloud technology has matured considerably over the past half-decade, big corporations that run their own data centers still dominate the majority of the world’s IT infrastructure.

[Data Science from Scratch](https://www.oreilly.com/library/view/data-science-from/9781492041122/)

[ Michoel Snow, Hillary Green-Lerman: Hacking the Data Science Challenge | PyData New York City 2019 ](https://www.youtube.com/watch?v=DU-DlD-eKD0)

[How we scaled data science to all sides of Airbnb over 5 years of hypergrowth](https://venturebeat.com/2015/06/30/how-we-scaled-data-science-to-all-sides-of-airbnb-over-5-years-of-hypergrowth/)

[drawdata.xyz](https://drawdata.xyz/) - Draw your Data and Download as CSV or JSON

[What Does It Take to be a Successful Data Scientist?](https://hdsr.mitpress.mit.edu/pub/5irjez4q/)

[Practical advice for analysis of large, complex data sets - Google - 2016](http://www.unofficialgoogledatascience.com/2016/10/practical-advice-for-analysis-of-large.html)

[abhat222/Data-Science-Cheat-Sheet](https://github.com/abhat222/Data-Science--Cheat-Sheet)

[50 years of Data Science](https://courses.csail.mit.edu/18.337/2015/docs/50YearsDataScience.pdf) - [hacker news discussion](https://news.ycombinator.com/item?id=10431617)

Breiman (2001) Statistical Modeling: The Two Cultures - [paper](https://projecteuclid.org/download/pdf_1/euclid.ss/1009213726) - [hacker news discussion](https://news.ycombinator.com/item?id=19835962) - [summary](http://duboue.net/blog27.html)

[Tea: A High-level Language and Runtime System for Automating Statistical Analysis - YouTube](https://www.youtube.com/watch?v=bBCSeud21YU)

[DataKind Projects](https://www.datakind.org/projects)

[Scipy Lecture Notes](https://scipy-lectures.org/index.html)

[Coding habits for data scientists](https://www.thoughtworks.com/insights/blog/coding-habits-data-scientists)

Complexity is driven by interconnected parts:
- dependency

Complexity can't be avoided - but it can be compartmentalized.

[Creating correct and capable classifiers - Ian Ozsvald](https://youtu.be/t6osKvhY6Ro?si=Dlm-N0Px4ARWdk18)


## Blog posts

[SharpestMinds](https://www.sharpestminds.com/blog)
- [What’s happened to the data science job market in the past month](https://www.sharpestminds.com/blog/whats-happened-to-the-data-science-job-market-in-the-past-monthhttps://www.sharpestminds.com/blog/whats-happened-to-the-data-science-job-market-in-the-past-month)
- [Why you shouldn’t be a data science generalist](https://www.sharpestminds.com/blog/why-you-shouldnt-be-a-data-science-generalist)

[Data science is different now - Vicki Boykis](https://veekaybee.github.io/2019/02/13/data-science-is-different/)

[Beware the data science pin factory: The power of the full-stack data science generalist and the perils of division of labor through function](https://multithreaded.stitchfix.com/blog/2019/03/11/FullStackDS-Generalists/)

[Data Science: Reality Doesn't Meet Expectations - Dan Friedman](https://dfrieds.com/articles/data-science-reality-vs-expectations.html)

[Here’s why so many data scientists are leaving their jobs](https://towardsdatascience.com/why-so-many-data-scientists-are-leaving-their-jobs-a1f0329d7ea4)

[The Future of Data Science is Past](http://koaning.io/posts/the-future-is-past/)

The jupyter notebook that contains the recommender algorithm is not the investment that needs to be made by the team but rather it is all the stuff around the algorithm that requires practically all the work. Note that step 5 also requires communication with a big data cluster which also demonstrates that a recommender is more of an engineering investment than an algorithmic one. You don’t want a pure scientist team here, you need solid engineers and developers.

This is besides the fact that a lot of good algorithms can be created with simple heuristics that don’t require a maths degree. One could:

- recommend content that is often watched together
- recommend content that is often watched together unless it is too popular
- recommend the next episode

These are all fair options to at least benchmark. I would also like to point out that the latter idea is a great idea even it isn’t technically machine learning. It should compete with any deep learning algorithm, any day.

The future of our applied field is not in our new algorithms. It is in remembering all the old things we used to do with algorithms before there was hype.

[Engineers Shouldn’t Write ETL: A Guide to Building a High Functioning Data Science Department](https://multithreaded.stitchfix.com/blog/2016/03/16/engineers-shouldnt-write-etl/)

Most shops foster a relationship between engineers and scientists that lies somewhere in the spectrum between non-existent1 and highly dysfunctional.

You Probably Don’t Have Big Data

Everybody Wants to be the “Thinker”

These data scientists occasionally manage to create some pretty cool and effective solutions, but by and large they focus on performing slightly higher level Report Developer-ing back to the business (which largely ignores their advice).But the role soun

ds really nice, and it’s easy to recruit for. Thus was born the traditional, modern day data science department: data scientists (Report developers aka “thinkers”), data engineers (ETL engineers aka “doers”), and infrastructure engineers (DBAs aka “plumbers”).Whoops. It would seem that the business intelligence

 department never really changed, we just added a Hadoop cluster and started calling it by a new name.

 Instead, you will hire mediocre engineers. They will create tremendously over complicated messes. This will exacerbate the contention. Welcome to the Vicious Cycle. The end result is a team of data scientists who are empowered to be little more than report developers because they lack the support of a solid, innovative data platform. And if your recruiting hype had pitched them on the Report Developer role, they would have run the other way. After all, they’re Thinkers, not Doers!

 A way that allows for autonomy in roles, true ownership all the way into production, and accountability for output.

 Engineers should not write ETL. For the love of everything sacred and holy in the profession, this should not be a dedicated or specialized role. There is nothing more soul sucking than writing, maintaining, modifying, and supporting ETL to produce data that you yourself never get to use or consume.Instea

 d, give people end-to-end ownership of the work they produce (autonomy). In the case of data scientists, that means ownership of the ETL. It also means ownership of the analysis of the data and the outcome of the data science. The best-case outcome of many efforts of data scientists is an artifact meant for a machine consumer, not a human one. Rather than a report, dashboard, or PowerPoint presentation, it is some sort of algorithm or API that is integrated into the engineering stack – something that fundamentally changes the operation of the business. Autonomy means the data scientists own that code as well. All the way into production. They should be able to develop and deploy it without asking the permission of engineers, be accountable for support, be held to performance, latency, and SLA requirements, etc.T

 his puts vertical responsibility and focus squarely into the hands of data scientists. 

## [Gabby Shklovsky - Random Forests Best Practices for the Business World - PyData NYC 2017](https://www.youtube.com/watch?v=E7VLE-U07x0) - [slides](https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.slideshare.net%2FPyData%2Frandom-forests-best-practices-for-the-business-world&redir_token=HgV_RBYb_uD_jYV6nYygn8RpyKR8MTU2OTkwODE2N0AxNTY5ODIxNzY3&v=E7VLE-U07x0&event=video_description)

### factor out linear relationships

R2 = misleading when comparing model w & wout linear component

## best practice for interpreting

Feature importances

Check bidirectional relationship for top predictors & response
- manually check a few trees (4-5)
- parametric study across one feature - need to use multiple datasets (non-linear model!)  - use test data

Tree graphics = export graph vis

## Repos

[donnemartin/data-science-ipython-notebooks](https://github.com/donnemartin/data-science-ipython-notebooks)

## Articles

[Why you should care about the Nate Silver vs. Nassim Taleb Twitter war](https://towardsdatascience.com/why-you-should-care-about-the-nate-silver-vs-nassim-taleb-twitter-war-a581dce1f5fc)

## Textbooks

[The Nature of Code](https://natureofcode.com/book/) - Daniel Shiffman

[Hello, Startup: A Programmer's Guide to Building Products, Technologies, and Teams](https://www.amazon.co.uk/gp/product/B016YZWDA4/ref=ppx_yo_dt_b_d_asin_title_o01?ie=UTF8&psc=1)

[Automate the Boring Stuff with Python](https://automatetheboringstuff.com/)

[Python for Data Analysis](http://bedford-computing.co.uk/learning/wp-content/uploads/2015/10/Python-for-Data-Analysis.pdf)

[Agile Data Science - Russell Jurney](https://www.oreilly.com/library/view/agile-data-science/9781449326890/)

## Blogs

[Probably Overthinking It - Allen Downey](https://www.allendowney.com/blog/)

[The Unofficial Google Data Science Blog](http://www.unofficialgoogledatascience.com/)

[koaning.io](https://koaning.io/) - Vincent D. Warmerdam

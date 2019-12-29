[Data Science from Scratch](https://www.oreilly.com/library/view/data-science-from/9781492041122/)

[What Does It Take to be a Successful Data Scientist?](https://hdsr.mitpress.mit.edu/pub/5irjez4q/)

[Practical advice for analysis of large, complex data sets - Google - 2016](http://www.unofficialgoogledatascience.com/2016/10/practical-advice-for-analysis-of-large.html)

[abhat222/Data-Science--Cheat-Sheet](https://github.com/abhat222/Data-Science--Cheat-Sheet)

[50 years of Data Science](https://courses.csail.mit.edu/18.337/2015/docs/50YearsDataScience.pdf) - [hacker news discussion](https://news.ycombinator.com/item?id=10431617)

Breiman (2001) Statistical Modeling: The Two Cultures - [paper](https://projecteuclid.org/download/pdf_1/euclid.ss/1009213726) - [hacker news discussion](https://news.ycombinator.com/item?id=19835962) - [summary](http://duboue.net/blog27.html)

[Tea: A High-level Language and Runtime System for Automating Statistical Analysis - YouTube](https://www.youtube.com/watch?v=bBCSeud21YU)

## Blog posts

[Data science is different now - Vicki Boykis](https://veekaybee.github.io/2019/02/13/data-science-is-different/)

[Beware the data science pin factory: The power of the full-stack data science generalist and the perils of division of labor through function](https://multithreaded.stitchfix.com/blog/2019/03/11/FullStackDS-Generalists/)

[The Future of Data Science is Past](http://koaning.io/posts/the-future-is-past/)

The jupyter notebook that contains the recommender algorithm is not the investment that needs to be made by the team but rather it is all the stuff around the algorithm that requires practically all the work. Note that step 5 also requires communication with a big data cluster which also demonstrates that a recommender is more of an engineering investment than an algorithmic one. You don’t want a pure scientist team here, you need solid engineers and developers.

This is besides the fact that a lot of good algorithms can be created with simple heuristics that don’t require a maths degree. One could:

recommend content that is often watched together
recommend content that is often watched together unless it is too popular
recommend the next episode
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




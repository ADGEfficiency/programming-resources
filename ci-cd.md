[Testing Firefox more efficiently with machine learning - Mozilla Hacks - the Web developer blog](https://hacks.mozilla.org/2020/07/testing-firefox-more-efficiently-with-machine-learning/)

So how do we keep our CI load manageable? 

First, we recognize that some of those ninety unique configurations are more important than others. Many of the less important ones only run a small subset of the tests, or only run on a handful of pushes per day, or both. 

Second, in the case of our testing branch, we rely on our developers to specify which configurations and tests are most relevant to their changes. 

Third, we use an integration branch.

[“Who Should Write the Terraform?” – zwischenzugs](https://zwischenzugs.com/2022/08/08/who-should-write-the-terraform/)

Five key factors that influence whether Terraform should be centralized or distributed:

    Non-negotiable standards (security, compliance) may require centralized control.
    The capability of development teams to take on infrastructure responsibilities.
    Management's ability to understand and support a centralized platform approach.
    The capability of the centralized platform team itself.
    The importance of rapid time-to-market for the business.

There is no single right answer, as it depends on weighing the tradeoffs for each organization based on these factors.

Make intentional decisions while being aware of the systemic forces and risks involved in either centralizing or distributing cloud infrastructure responsibilities.

Problems with separating dev & ops:

- Release overhead and friction
- Misplaced expertise - The dev teams had deep knowledge of the applications they built, but the ops teams managing the infrastructure didn't have that same application-specific expertise.
- Siloed responsibilities 

At the purest extreme, DevOps is the movement of all infrastructure and operational work and responsibilities (ie ‘delivery dependencies’) into the development team.

SRE emphasised the importance of getting Dev skills into Ops rather than making Dev and Ops a single organisational unit. 

[Testing Firefox more efficiently with machine learning - Mozilla Hacks - the Web developer blog](https://hacks.mozilla.org/2020/07/testing-firefox-more-efficiently-with-machine-learning/)

So how do we keep our CI load manageable? 

First, we recognize that some of those ninety unique configurations are more important than others. Many of the less important ones only run a small subset of the tests, or only run on a handful of pushes per day, or both. 

Second, in the case of our testing branch, we rely on our developers to specify which configurations and tests are most relevant to their changes. 

Third, we use an integration branch.

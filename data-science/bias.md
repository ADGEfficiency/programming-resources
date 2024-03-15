[Moving beyond “algorithmic bias is a data problem” | Hacker News](https://news.ycombinator.com/item?id=28233077)

Wouldn’t it be better to talk about “fairness” or something?

---

There are many meanings of the term bias in ML. First let's define which the author is talking about. Some options are:

1. The idea of ignoring relevant features, ala bias-variance trade off.

2. Data bias, where data is trained on inputs / behavior that society would deem biased. Ex. A company frequently discriminates against group X, an ML model is trained on data / decisions this company has made and as a result encodes the same biases.

3. Features are used which are a proxy for other items. Ex. (pulling this out of the air), a repair shop charges a variable rate for repair. It takes in a number of inputs. It's illegal to offer higher prices to women for the same repair as men, but instead an ML model uses as input the customer's first name which ends up being nothing more than a proxy for their gender and introduces that bias.

4. A group of people A have a much smaller portion of the training data size in an ML model than group B. The model makes decisions for offering some good (ex. a loan). Because it's training data is larger on people from group B than group A it always has more confidence in its predictions from group B. The model is set to be risk adverse, so by default it rejects the majority of people from group A even though most of them would have been valid loans. (Where A and B are different across some societal class like religion, race, ethnicity, gender...)

The author is talking about the fourth case. While yes there is over/under representation in the input data, the algorithm chosen to build the model encodes its own form of bias.

A simple example everyone should be familiar with, using Mean Squared Error vs. Mean Absolute Error (or MBE) produce models that handle rarely seen features or data points very differently. This choice of loss function introduces algorithmic bias into a model. That's essentially what underlies the concept. Yes there is data bias, but what is being argued is that the solution isn't "find perfectly unbiased data" (because in many cases that's impossible), it's understand how the choice of algorithm will produce models that respond to and represent differently those data biases. 

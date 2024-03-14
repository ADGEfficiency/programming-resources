[I’ve vastly misunderstood the Single Responsibility Principle](https://www.sicpers.info/2023/10/ive-vastly-misunderstood-the-single-responsibility-principle/)

> When you write a software module, you want to make sure that when changes are requested, those changes can only originate from a single person, or rather, a single tightly coupled group of people representing a single narrowly defined business function.
>
> Robert Martin, The Single Responsibility Principle

The principle is that the module’s behaviour is the responsibility of a single actor. 

It’s not that the module has a single reason to change, but that a single entity will request the changes.

[I’ve vastly misunderstood the Single Responsibility Principle](https://www.sicpers.info/2023/10/ive-vastly-misunderstood-the-single-responsibility-principle/)

> When you write a software module, you want to make sure that when changes are requested, those changes can only originate from a single person, or rather, a single tightly coupled group of people representing a single narrowly defined business function.
>
> Robert Martin, The Single Responsibility Principle

The principle is that the module’s behaviour is the responsibility of a single actor. 

It’s not that the module has a single reason to change, but that a single entity will request the changes.

---

 The problem with the single responsibility principle isn't that it's wrong per se, but that what counts as a responsibility is undefined. 

---

An object is evidence that you’ve done something, even if all you did is gather enough data to construct the object. The object’s methods are the things you can do now that you’ve constructed the object, and (in C++ especially) the object is a promise that you will do something when the object is destroyed. 

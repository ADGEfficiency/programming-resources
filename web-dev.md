[vasanthk/how-web-works](https://github.com/vasanthk/how-web-works) - 

[Building Large Flask Apps in the Real World ](https://news.ycombinator.com/item?id=11121355)

In the end you should be aiming to design your application to depend on Flask as little as possible... Because my core app is decoupled from the web app it's all really easy to do.

[API design: Why you should use links, not keys, to represent relationships in APIs](https://cloud.google.com/blog/products/application-development/api-design-why-you-should-use-links-not-keys-to-represent-relationships-in-apis)

Put the full link as the values in the json returned by a url

```
{self: /pets/1234,
owner : /people/564}
```

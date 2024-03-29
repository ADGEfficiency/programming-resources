[The Yaml document from hell | Hacker News](https://news.ycombinator.com/item?id=34351503)

 JSON has no comments. That disqualifies it immediately. 

---

We had INI format for simple stuff and XML (protected with entire schema) for complex things many years ago, which worked. Yet, we wanted something readable (like INI), but able to express complex types (XML).

I don't think Toml is a viable replacement - for me, it has an INI-level of simplicity with even worst hacks to have nested structures. But, give it time and you'll have another YAML.

But yes, YAML is confusing for edge cases (true/false, quoting), but I'm going to find a powerful replacement that is not XML. Maybe END can jump in, but for anything more complex, I'd rather have a Lisp interpreter and structures around than any of mentioned and upcoming formats.

---

If JSON and YAML were first on the scene; XML would be invented as an answer.

Hard to mess up. Robust schema language. Very flexible. Easy to process.

Yeah, it’s verbose, but that’s the trade-off between usability and robustness.

---

Jsonnet and Cue are the places to be looking. 

---

YAML is nuts, and JSON is annoying (trailing comma limitations, lack of comment syntax no matter how annoying it is that the spec is correct about why there are no comments).


[Falcor: JSON Graph](https://netflix.github.io/falcor/documentation/jsongraph.html)

JSON Graph is a convention for modeling graph information as a JSON object. 

```json
{
    todosById: {
        "44": {
            name: "get milk from corner store",
            done: false,
            prerequisites: [{ $type: "ref", value: ["todosById", 54] }]
        },
        "54": {
            name: "withdraw money from ATM",
            done: false,
            prerequisites: []
        }
    },
    todos: [
        { $type: "ref", value: ["todosById", 44] },
        { $type: "ref", value: ["todosById", 54] }
    ]
}
```

[crawshaw - 2021-11-25](https://crawshaw.io/blog/thankful-for-technology)

JSON is the worst form of encoding — except for all the others that have been tried. It’s complicated, but not too complicated. It’s not easily read by humans, but it can be read by humans. It is possible to extend it in intuitive ways. When it gets printed onto your terminal, you can figure out what’s going on without going and finding the magic decoder ring of the week. It makes some things that are extremely hard with XML or INI easy, without introducing accidental Turing completeness or turning country codes into booleans. Writing software is better for it, and shows the immense effect carefully describing something can do for programming. JSON was everywhere in our JavaScript before the term was defined, the definition let us see it and use it elsewhere.

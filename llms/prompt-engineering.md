[Prompt Engineering Guide](https://www.promptingguide.ai/)

[Prompt engineering - OpenAI API](https://platform.openai.com/docs/guides/prompt-engineering)

[GPT Best Practices | Hacker News](https://news.ycombinator.com/item?id=36197291)

Most of these tactics can be summarized into: "write clearly and provide ample information."

---

In what pre-ChatGPT world did "write clearly and provide ample information" include such familiar and long-known tips as:

* Ask the model to adopt a persona

* Use delimiters to clearly indicate distinct parts of the input

* Specify the desired length of the output

It's able to infer through quite a large amount of sloppiness. The much larger gains come from guiding it into a model of the world, as opposed to direct it to respond to lean perspectives like, "What do I eat to be better?" 

---

> Ask the model to adopt a persona

This is bad advice. In my experience asking it to take on a persona can muddy the text that it writes as that persona. I have told it to be a biographer persona, for it to write a biography that then claims the person was a biographer.

---

All of these best practices are great for managers dealing with their staff as well:

1. Write clear instructions
2. Provide reference text
3. Split complex tasks into simpler subtasks
4. Give time to "think"
5. Use external tools
6. Test changes systematically 

---

I find that working with LLMs feels closer to the skills of managing a team than to coding itself. Intuitions about how to divide work and understanding strengths and limitations seem to go far.

---

That's a really cool insight-- it's not coding. It's dispatching tasks to a team 

---

Here's my personal template for semi-complex prompts:

System message

  [A couple sentences of instructions]

  Example 1 - Input
  ##
  [example input 1]
  ##
  Example 1 - Output
  ##
  [example output 1]
  ##

User message

  Actual 1 - Input
  ##
  [the thing you want it to process]
  ##
  Actual 1 - Output
  ##

[An example of LLM prompting for programming](https://martinfowler.com/articles/2023-chatgpt-xu-hao.html)

The most interesting part of the prompt is the “implementation strategy” section which combines two styles of prompt:

1. Instruction prompting provides instructions for the LLM to follow
2. Chain of Thought prompting encourages the LLM to explain its reasoning.

Chain of thought in the context was critical to making the generated code fit together despite being generated in separate sessions.

[An example of LLM prompting for programming | Hacker News](https://news.ycombinator.com/item?id=35612494)

Good rule of thumb with ChatGPT: you can’t exit loops. Once you’ve gone A > B > A, your best move is to start a new chat.

---

There's an unfortunately common take on AI that goes basically like this:

"I tried it and it didn't do what I wanted, not impressed."

My suggestion is to tune out the noise and really try experimenting with these tools – and know that they're rapidly improving. Even if ultimately you have criticisms or decide one way or another, at least really investigate them for your own use-cases rather than jumping on a bandwagon that's either "AI is bad" or the breathless hype-machine at the other end. 

---

[The entire prompt of Microsoft Bing Chat?! (Hi, Sydney.)](https://twitter.com/kliu128/status/1623472922374574080/photo/1)

Informative, visual, logical, actionable, rigirous, intelligent, defensible

[Ask HN: What are your most used Chat GPT prompts | Hacker News](https://news.ycombinator.com/item?id=38244769)

The most effective way I've found to prompt GPT-4 is to ask it to create the optimal prompt for you. Try this meta prompt to help craft your prompts:

I create separate conversation threads for each expert persona of GPT. You are PromptGPT. You are a prompt engineer expert for large language models. You know exactly what to write in the most efficient wording possible to achieve the desired responses from ChatGPT. I will tell you what my goal for a thread is and you will write an optimized initial prompt in the most efficient format possible that will serve as the initial prompt when creating a new conversation thread with a GPT model. You will define the expert persona, the parameters or rules of the responses, you should also provide any other information that a GPT thread may need to understand exactly what it needs to do to give me the most accurate answers depending on my goal with that particular thread and the tone of voice, within the prompt you provide.

Are you ready or is there any other information you need to perform this job to your best ability

[ray-project/llm-numbers: Numbers every LLM developer should know](https://github.com/ray-project/llm-numbers)

Be concise -> save 40 to 90%

750 word document ~ 1000 tokens

~$1 million: Cost to train a 13 billion parameter model on 1.4 trillion tokens

[Don Knuth plays with ChatGPT](https://cs.stanford.edu/~knuth/chatGPT20.txt)

[Don Knuth plays with ChatGPT | Hacker News](https://news.ycombinator.com/item?id=36012360)

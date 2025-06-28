[opytimizer](https://github.com/gugarosa/opytimizer) - [docs](https://opytimizer.readthedocs.io/en/latest/)

[Baby Steps into Genetic Programming | Hacker News](https://news.ycombinator.com/item?id=43605731)

Bayesopt or Genetic Programming, or any search algorithm that can operate over non-differentiable objective functions are very useful in practice. For ex, when performing model selection in the space of hyperparameters, when your model is not differentiable such as a traditional Decision Tree [4]. Or exotic use-cases like molecule discovery [5].

---

I've been working on GP architectures that use short linear program tapes as part of their genome. Executing these programs can be done very quickly. Assuming the program tape is <=10kb in length and you are constraining to ~a megacycle in the interpreter, you can execute these programs 100k~1m times per second on a chunky workstation. The problems you can solve in this time & space are non-trivial. Once you evolve the desired program, you can write the interpreter for it in any language on any platform within half an hour.

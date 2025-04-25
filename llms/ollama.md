[Open source conversational RAG on local files](https://www.reddit.com/r/ollama/comments/1h1q4n9/open_source_conversational_rag_on_local_files/?share_id=73QeDKAeaHjhxxHZZkPho&utm_name=androidcss)

[Structured outputs · Ollama Blog](https://ollama.com/blog/structured-outputs)

```python
response = chat(
  messages=[
    {
      'role': 'user',
      'content': '''
        I have two pets.
        A cat named Luna who is 5 years old and loves playing with yarn. She has grey fur.
        I also have a 2 year old black cat named Loki who loves tennis balls.
      ''',
    }
  ],
  model='llama3.1',
  format=PetList.model_json_schema(),
)
```

---

[ollama/ollama](https://github.com/ollama/ollama)

```
ollama pull mistral:instruct
```

Output to file:

```
ollama run dolphin-phi "prompt" >> response.md
```

## Modelfiles

[ollama/docs/modelfile.md at main · ollama/ollama](https://github.com/ollama/ollama/blob/main/docs/modelfile.md)

```ModelFile
FROM mistral

PARAMETER temperature 1

SYSTEM A system message
```

```
ollama create custom -f Modelfile
ollama run custom
```

### Viewing Modelfiles

```
ollama show --modelfile mistral
```

## Models

[Mistral 7B LLM](https://www.promptingguide.ai/models/mistral-7b)

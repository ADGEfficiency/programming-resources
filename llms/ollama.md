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

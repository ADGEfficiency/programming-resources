## Preallocating array memory before loops

```python
data = []

for iteration in range(5):
    data.append(1000)

data = np.array(data)
```

versus

```python
data = np.zeros(5)

for iteration in range(5):
    data[iteration] = 1000
```

## Resources

[A Visual Intro to NumPy and Data Representation - Jay Alammar](https://jalammar.github.io/visual-numpy/)

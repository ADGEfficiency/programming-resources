[VECTORS, MATRICES, AND ARRAYS RECIPES IN PYTHON](https://dataisutopia.com/blog/vectors-matrices-and-arrays-recipes-in-python/)


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

[Making computation easier with cool Numpy tricks - Kirit Thadaka - PyData London 2018](https://www.youtube.com/watch?v=lSU0CN9Efss)

[Advanced NumPy | SciPy Japan 2019 Tutorial | Juan Nunuz-Iglesias](https://www.youtube.com/watch?v=cYugp9IN1-Q)

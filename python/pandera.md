# pandera

Benefits:

1. runtime validation,
2. annotation of what columns are in a dataframe.

https://pandera.readthedocs.io/en/stable/

- runtime validation of data 
- improved developer experience of knowing what a dataframe looks like at a certain point in the program that I've fallen in love with.

- [pydantic style definition](https://pandera.readthedocs.io/en/stable/schema_models.html) 
- [pipeline decorators](https://pandera.readthedocs.io/en/stable/decorators.html) but ultimately preferred doing the validation using `.validate`.

Another exciting feature is the [integration with hypothesis](https://pandera.readthedocs.io/en/stable/data_synthesis_strategies.html) - parameterized testing would be a way to take our testing of Vippy core to the next (much slower) level.



## Decorate

```python
@pandera.check_input(raw_data_schema)
def data(raw):
```



---

Validate outside the pipeline

Good
- cleans up datapipelines - moves data validation out of the processing logic

---
It has an obvious benefit of runtime validation of data - but it's the improved developer experience of knowing what a dataframe looks like at a certain point in the program that I've fallen in love with.

It also has a pydantic style definition of the schemas. I experimented with the pipeline decorators but ultimately preferred doing the validation using .validate.

Another exciting feature is the integration with hypothesis - parameterized testing.

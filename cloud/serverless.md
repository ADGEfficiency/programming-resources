```
sls print
```

---

Invoke locally
```
sls invoke local --function get_solcast_data --stage prod --path ./unmetered-sydney-opera-house.json
```
Deploy
```
sls deploy --stage test
```
Package
```
sls package --stage test
```

Remove
```
sls remove --stage dev
```

Test deployed Lambda locally:

```bash
$ serverless invoke --function data_ingestion --stage test --path ./test_data/test-sunrise.json --aws-profile gridcog-dev
```

[The traits of serverless architecture](https://www.thoughtworks.com/insights/blog/traits-serverless-architecture)O

- low barrier-to-entry
- hostless
- stateless
- elasticity
- distributed
- event-driven

[What a typical 100% Serverless Architecture looks like in AWS!](https://medium.com/serverless-transformation/what-a-typical-100-serverless-architecture-looks-like-in-aws-40f252cd0ecb)

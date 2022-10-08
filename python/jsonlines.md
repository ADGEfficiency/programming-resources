Create

with jsonlines.open(base / "results.jsonl", mode="a") as writer:
    writer.write(res)

Read
import jsonlines

with jsonlines.open(str(fi), mode="r") as reader:
    grid = pd.DataFrame([d for d in reader])

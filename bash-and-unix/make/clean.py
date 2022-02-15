#!/usr/bin/env python3
from datetime import datetime
import json
from pathlib import Path

data = json.loads((Path.cwd() / "data" / "raw.json").read_text())
data["data"] = "clean"
data["clean-time"] = datetime.utcnow().isoformat()
data["clean-date"] = datetime.utcnow().strftime("%Y-%m-%d")
print(f"ingesting {data}")
fi = Path.cwd() / "data" / "clean.json"
fi.write_text(json.dumps(data))

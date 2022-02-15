#!/usr/bin/env python3
from datetime import datetime
import json
from pathlib import Path

fi = Path.cwd() / "data" / "raw.json"
fi.parent.mkdir(exist_ok=True)
data = {"data": "raw", "ingest-time": datetime.utcnow().isoformat()}
print(f"ingesting {data}")
fi.write_text(json.dumps(data))

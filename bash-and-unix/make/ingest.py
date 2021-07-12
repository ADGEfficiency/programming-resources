#!/usr/bin/env python3
import json
from pathlib import Path

fi = Path.cwd() / "data" / "raw.json"
fi.parent.mkdir(exist_ok=True)
data = {"data": "raw"}
fi.write_text(json.dumps(data))

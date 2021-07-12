#!/usr/bin/env python3
import json
from pathlib import Path

fi = Path.cwd() / "data" / "clean.json"
fi.parent.mkdir(exist_ok=True)
data = {"data": "clean"}
fi.write_text(json.dumps(data))

import pathlib
import requests
import re

data = pathlib.Path("./lessons-learnt.md").read_text()

links = re.findall(r"\((http\S+)\)", data)

for link in links:
    print(link)

all: ./data/clean.json

./data/raw.json:
	mkdir -p data
	./ingest.py

./data/clean.json: ./data/raw.json
	./clean.py

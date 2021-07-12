all: show

./data/raw.json: ./ingest.py
	./ingest.py

./data/clean.json: ./clean.py ./data/raw.json
	./clean.py

show: ./data/clean.json
	./show.sh

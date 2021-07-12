# make

## Setup

```bash
chmod +x *.py *.sh
```

Build a simple data pipeline:

```
make
```

Use simple Python scripts as mock for real data tasks.


## Simple program

```makefile
all: ingest clean show
ingest: 
	./ingest.py
clean:
	./clean.py
show:
	./show.sh
```


## With dependencies

- dependencies on both the source code changing and the data changing

```makefile
all: show

./data/raw.json: ./ingest.py
	./ingest.py

./data/clean.json: ./clean.py ./data/raw.json
	./clean.py

show: ./data/clean.json
	./show.sh
```


## Set variables

```bash
$ make clean DIR=~/bin
```

```makefile
DIR = ~/binary

clean:
 rm ${DIR}
```

## pipeline notes on make

Machine readable documentation

Dependency, retries

Easy to test

Parallel executaion of targets

Track changes in git


## resources

Introduction to Make - https://www.grymoire.com/Unix/Make.html#What_is_make.3F_What_does_the_command_do.3F

```makefile
<target>: <prerequisites>
<tab>	<recipe>
```

## GNU make - https://www.gnu.org/software/make/manual/make.html



## How to use Makefiles to run a simple Map Reduce Data Pipeline - https://www.benevolent.com/engineering-blog/make-reduce-how-to-use-makefiles-to-run-a-simple-map-reduce-data-pipeline


Introduction to Make - https://www.grymoire.com/Unix/Make.html#What_is_make.3F_What_does_the_command_do.3F

## GNU make - https://www.gnu.org/software/make/manual/make.html

## https://www.benevolent.com/engineering-blog/make-reduce-how-to-use-makefiles-to-run-a-simple-map-reduce-data-pipeline




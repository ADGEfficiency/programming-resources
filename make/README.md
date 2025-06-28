# make

A bit about `make` & Makefiles.

Machine readable workflow:

- stood test of time,
- powerful,
- available everywhere.

Make = 1977, has its quirks

Rules can be moved between work flows - some even have entire workflows that can be ported across projects.

## Setup

I've included a simple `make` driven data pipeline - to run it you will need to make a few files executable:

```bash
$ chmod +x *.py *.sh
```

```bash
$ make
```

## Why `make`

Machine readable documentation
- track changes in source control (git),
- encourages modularity / functional decomposition of shell scripts,
- makes pipelines reproducible.

Dependency, retries
- won't re-run code that has already been run,
- will re-run if the source code changes,
- and much more!

Parallel execution of targets


## Why not make

Multiple machines

Workflows that are not based on files


## `make`

The `make` program looks for a `Makefile`

```bash
$ make
```

Make is for making files - the files we make depend on other files that we make.

## Makefile

Makefile will express your workflow backwards as dependencies between files

Won't change how you are fundamentally doing something - still will run same Python scripts etc.

Makefiles are very close to raw shell scripts (like a Dockerfile)

```makefile
targetfile: sourcefile
	command
```

source = prerequisites

tab indented commands

```makefile
<target>: <prerequisites>
<tab>	<commands>
```

Targets to be built, commands are executed to build targets

Determines if a set of commands need to be executed by checking the timestamp of the target

This implies that the target is a file

Dummy target = meta target = no commands, only dependencies

## Variable Assignment


```Makefile
account ?= dev
all:
	echo $(account)
```

```
$ make 
echo dev
dev
$ make account=prod
echo prod
prod
```

## Default Arguments

`=` recursive / deferred assignment = evaluated each time the variable is encountered in the code.

`:=` simple assignment = evaluated once at the first occurrence

`?=` conditional assignment = evaluated only if variable doesn't have a value.

Example Makefile

```
SIMPLE := $(shell date)
RECURSIVE = $(shell date)
CONDITIONAL ?= "not-set-elsewhere"

all:
	@echo "simple 1 $(SIMPLE)"
	@echo "simple 2 $(SIMPLE)"
	@echo "\nrecursive 1 $(RECURSIVE)"
	@echo "recursive 2 $(RECURSIVE)"

other:
	@echo $(CONDITIONAL)
```

Example of simple and recursive:

```shell-session
$ make all
simple 1 Mon 12 Dec 2022 01:44:01 NZDT
simple 2 Mon 12 Dec 2022 01:44:01 NZDT

recursive 1 Mon 12 Dec 2022 01:44:01 NZDT
recursive 2 Mon 12 Dec 2022 01:44:01 NZDT
```

Example of conditional:

```shell-session
$ make other
not-set-elsewhere

$ make other CONDITIONAL=command-line
command-line
```



## Tricks

Pass in command line arguments:

```bash
$ make target ARGUMENT=value
```

A definition has the form:

```makefile
$(ARGUMENT)
#  value
```

`$<` =  first dependency

`$@` = build target filename

`$?` = all dependencies that have a timestamp more recent than target

 To refer to the basename of the target file, use $(basename $@)

Uses touch to update the last modified time of the unzipped file - as this can be earlier than the zip

```
gz_2010_us_050_00_20m.shp: counties.zip
	unzip counties.zip
	touch gz_2010_us_050_00_20m.shp
```



## Rob Hyndman's Project Makefile

From [Makefiles for R/LaTeX projects](https://robjhyndman.com/hyndsight/makefiles/)

```Makefile
# Usually, only these lines need changing
TEXFILE= paper
RDIR= .
FIGDIR= ./figs

# list R files
RFILES := $(wildcard $(RDIR)/*.R)
# pdf figures created by R
PDFFIGS := $(wildcard $(FIGDIR)/*.pdf)
# Indicator files to show R file has run
OUT_FILES:= $(RFILES:.R=.Rout)
# Indicator files to show pdfcrop has run
CROP_FILES:= $(PDFFIGS:.pdf=.pdfcrop)

all: $(TEXFILE).pdf $(OUT_FILES) $(CROP_FILES)

# May need to add something here if some R files depend on others.

# RUN EVERY R FILE
$(RDIR)/%.Rout: $(RDIR)/%.R $(RDIR)/functions.R
    R CMD BATCH $<

# CROP EVERY PDF FIG FILE
$(FIGDIR)/%.pdfcrop: $(FIGDIR)/%.pdf
    pdfcrop $< $< && touch $@

# Compile main tex file and show errors
$(TEXFILE).pdf: $(TEXFILE).tex $(OUT_FILES) $(CROP_FILES)
    latexmk -pdf -quiet $(TEXFILE)

# Run R files
R: $(OUT_FILES)

# View main tex file
view: $(TEXFILE).pdf
    evince $(TEXFILE).pdf &

# Clean up stray files
clean:
    rm -fv $(OUT_FILES) 
    rm -fv $(CROP_FILES)
    rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
    rm -fv *.out *.bcf *blx.bib *.run.xml
    rm -fv *.fdb_latexmk *.fls
    rm -fv $(TEXFILE).pdf

.PHONY: all clean
```


## Resources

### Introduction

[A short introduction to make - Matt Might](https://matt.might.net/articles/intro-to-make/)

[What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile)

[Make - Wikipedia](https://en.wikipedia.org/wiki/Make_(software))

[Makefile Tutorial By Example](https://makefiletutorial.com/#top)

[A Tutorial on Portable Makefiles](https://nullprogram.com/blog/2017/08/20/)

[How I stopped worrying and loved Makefiles](https://gagor.pro/2024/02/how-i-stopped-worrying-and-loved-makefiles/) - [Hacker News](https://news.ycombinator.com/item?id=40182555)

### Discussion

[Makefiles for Web Work](https://rosszurowski.com/log/2022/makefiles)

Using `?=` you can set default variables that you can override outside of make. 

You can document commands with a ## comment at the end of a line. For example:

```makefile
help: ## Show this help
	@echo "\nSpecify a command. The choices are:\n"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help

dev: node_modules ## Start a local development server
	@./node_modules/.bin/next dev
.PHONY: dev
```

Can then see this with `make help`

[Self-Documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)

```makefile
.PHONY: help

.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install npm dependencies for the api, admin, and frontend apps
	@echo "Installing Node dependencies"
	@npm install
```

[Absolutely do not use make for any new project - Hacker News](https://news.ycombinator.com/item?id=5275752)

[The Unreasonable Effectiveness of Makefiles](https://matt-rickard.com/the-unreasonable-effectiveness-of-makefiles) - [HN discussion](https://news.ycombinator.com/item?id=32438616)

### Reference

Introduction to Make - https://www.grymoire.com/Unix/Make.html#What_is_make.3F_What_does_the_command_do.3F

GNU make - https://www.gnu.org/software/make/manual/make.html

How to use Makefiles to run a simple Map Reduce Data Pipeline - https://www.benevolent.com/engineering-blog/make-reduce-how-to-use-makefiles-to-run-a-simple-map-reduce-data-pipeline

https://www.benevolent.com/engineering-blog/make-reduce-how-to-use-makefiles-to-run-a-simple-map-reduce-data-pipeline

[Managing Projects with GNU Make, Third Edition](https://www.oreilly.com/openbook/make3/book/index.csp)

### Makefiles In The Wild

[GNU Make for Reproducible Data Analysis - Zach Jones](http://zmjones.com/make/)

[Makefiles for R/LaTeX projects - Rob Hyndman](https://robjhyndman.com/hyndsight/makefiles/)

[Why Use Make - Mike Bostok](https://bost.ocks.org/mike/make/)

[`make` as a Static Site Generator](https://www.karl.berlin/static-site.html)

[stripe-cli/Makefile](https://github.com/stripe/stripe-cli/blob/master/Makefile)

[aclark4life/project-makefile](https://github.com/aclark4life/project-makefile)

### Other Task Runners

[Taskfile](https://taskfile.dev/)

[Justfile](https://just.systems/man/en/)

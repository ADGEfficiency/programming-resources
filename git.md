## 95% of my git workflow

What is going on?

```bash
git status

git diff
```

Add all files that are already tracked by the repo that have changes, commit and push to GitHub:

```bash
git add -u

git commit -m 'message'

git push origin master
```

## Cloning an existing repo

To clone a repo, simply use the website for the repo on github - don't download and unzip!

For example, to clone this repo:

```bash
git clone https://github.com/ADGEfficiency/programming-resources
```

## Initializing a repo

To start from the start, lets:
- make an empty directory
- make a file
- initialize the repo
- add all files
- commit the changes

```bash
mkdir practice-repo

cd practice-repo

git init

touch README.md

git add *

git commit -m 'initial commit'
```

Note that we don't push this anywhere - the git repo can happily live and track changes to our code locally.

## Working with GitHub

Git is a version tracking system that can happily run locally.  GitHub will host your git repo and adds additional functionality.

Lets add our practice repo to GitHub (this is done on the GitHub website) - https://github.com/new

We can now push our repo up to Github.

```bash
git push -u origin master
```

## Working on someone else's repo

A common workflow is where you want to work on someone elses repo and send your changes back to them.  One way to do this is to:
- fork their repo to your GitHub
- commit your changes to your forked repo
- open a pull request on GitHub (you can't use the command line for this!)

## User beware

Git works because it remembers everything - if you commit 10 GB of images it will always be there.

Commands like checkout, reset can overwrite your work - this will happen to you when you are learning.

The best practice is small, regular commits - commit early and often.

## gitignore

There are lots of types of files we don't want in our repos - we can tell git to ignore these using a `.gitignore`

We can also have global gitignores:

```bash
#  set a global gitignore
git config --global core.excludesfile '~/.gitignore'

#  show global gitignore
git config --get core.excludesfile
```

## Dev branches

Branching is not required on all projects.  Sometimes it can be nice to have a stable master branch and to experiment in another branch.

```bash
git checkout -b dev

touch dev.py

git add dev.py

git commit -m 'dev work'
```

Now if I want these changes in my master branch:

```bash
git checkout master

git merge dev
```

## Resources

[The essential git handbook](https://medium.freecodecamp.org/the-essential-git-handbook-a1cf77ed11b5)

[Git reference](https://git-scm.com/docs)

## Advanced

[More productive Git](https://increment.com/open-source/more-productive-git/)

[Git From the Bits Up](https://www.youtube.com/watch?v=MYP56QJpDr4)

[GOTO 2015 • Deep Dive into Git • Edward Thomson](https://www.youtube.com/watch?v=dBSHLb1B8sw)

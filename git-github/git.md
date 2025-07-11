# Git

![](https://imgs.xkcd.com/comics/git_2x.png)

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

Using `git add -u` only works when files have already been committed to the repo.

We can instead add files by name:

```bash
$ touch README.md
$ git add README.md
```

Or add all files in the current directory:

```bash
$ git add .
```

Or add all files:

```bash
$ git add *
```

## Structure of a Git Repository

Working copy
- the files on your machine

The index / staging area / cache
- after `add`, before `commit`

The checked out branch
- branch that you tried the match the contents with

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

git log
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

Commands like `checkout`, reset can overwrite your work - this will happen to you when you are learning.

`checkout` will reset <filename> in your working copy to be equivalent with what’s in your index

```bash
git checkout -- <filename>
```

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

## Introductory

[A beginner's guide to Git version control](https://developers.redhat.com/articles/2023/08/02/beginners-guide-git-version-control)

[Git Techniques at Risk Ledger](https://riskledger.com/resources/git-basics-at-risk-ledger)

[Learn the workings of Git, not just the commands](https://developer.ibm.com/tutorials/d-learn-workings-git/)

[Confusing git terminology](https://jvns.ca/blog/2023/11/01/confusing-git-terminology/)

[Git For the Modern Data Scientist: 9 Git Concepts You Can’t Ignore](https://towardsdatascience.com/git-for-the-modern-data-scientist-9-git-concepts-you-cant-ignore-b4eaf7a154c2)

- repository,
- tracked & untracked,
- commit,
- staging area,
- hashes & tags,
- branch,
- HEAD,
- merge,
- stash,
- GitHub.

## Resources

[Git Reference Documentation](https://git-scm.com/docs):
- [Pro Git Book](https://git-scm.com/book/en/v2),
- [Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing),

[Beej's Guide to Git](https://beej.us/guide/bggit/)

[Learn Git Branching](https://learngitbranching.js.org/) - the most visual and interactive way to learn Git on the web.

[The Essential Git Handbook](https://medium.freecodecamp.org/the-essential-git-handbook-a1cf77ed11b5) - blog post.

[Things I wish Git had: Commit groups](http://blog.danieljanus.pl/2021/07/01/commit-groups/)

- merge commits vs. squash & merge vs. rebase & merge

[THIS IS HOW I GIT](https://daniel.haxx.se/blog/2020/11/09/this-is-how-i-git/) Git workflow from the developer of curl.

[Oh My Git!](https://ohmygit.org/) - downloadable game.

[Learn Git Branching JS](https://learngitbranching.js.org/) - interactive tutorial website to practice working with Git in your browser.

[Oh Shit, Git!?!](https://ohshitgit.com/) - how to get out of sticky situations in Git.

`git reflog` shows a log of changes to the local repository's HEAD and branch heads

```shell-session
$ git reflog
e9494c5 (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: commit: feat: keeping on up
602a6e4 HEAD@{1}: commit: feat: ups
aa972dc HEAD@{2}: commit: feat: ups
fea6e49 HEAD@{3}: commit: feat: ups
8b12a3c HEAD@{4}: commit: feat: ups ups ups :tada:
d4156df HEAD@{5}: clone: from github.com:ADGEfficiency/programming-resources

$ git reset HEAD@{index}
```

Amend previous commit:

```shell-session
$ git commit --amend --no-edit
```

```shell-session
$ git commit --amend --no-edit
```

[How Core Git Developers Configure Git](https://blog.gitbutler.com/how-git-core-devs-configure-git/)

```
# clearly makes git better

[column]
        ui = auto
[branch]
        sort = -committerdate
[tag]
        sort = version:refname
[init]
        defaultBranch = main
[diff]
        algorithm = histogram
        colorMoved = plain
        mnemonicPrefix = true
        renames = true
[push]
        default = simple
        autoSetupRemote = true
        followTags = true
[fetch]
        prune = true
        pruneTags = true
        all = true

# why the hell not?

[help]
        autocorrect = prompt
[commit]
        verbose = true
[rerere]
        enabled = true
        autoupdate = true
[core]
        excludesfile = ~/.gitignore
[rebase]
        autoSquash = true
        autoStash = true
        updateRefs = true
```


## Branching Strategies

[Gitflow Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

Legacy workflow - fallen in popularity in favour of trunk based.

[Trunk Based Development](https://trunkbaseddevelopment.com/)

Trunk = main = master.  Developers never work on release branches.

[Git Techniques at Risk Ledger](https://riskledger.com/resources/git-basics-at-risk-ledger)

Master, dev, feature. Squash onto dev.

See also [Git techniques | Hacker News](https://news.ycombinator.com/item?id=29162234) for disagreement with the Risk Ledger approach.

[Ship / Show / Ask](https://martinfowler.com/articles/ship-show-ask.html#HowDoYouDoContinuousIntegrationWithPullRequests)

Pull requests are categorized as either:

- Ship (merge into mainline without review), 
- Show (open a pull request for review, but merge into mainline immediately), 
- Ask (open a pull request for discussion before merging). 

Code review, or “Approval”, should not be a requirement for a Pull Request to be merged.

Our branches should not live long, and we should rebase them on the mainline often.

PRs should not replace other ways of having a conversation.

## Advanced

[Popular git config options](https://jvns.ca/blog/2024/02/16/popular-git-config-options/)

[Modern Git Commands and Features You Should Be Using](https://martinheinz.dev/blog/109)

[Cuddly, Octo-Palm Tree: The elements of git](https://cuddly-octo-palm-tree.com/posts/2021-09-19-git-elements/)

Why git repos would struggle with large binary files: as every change is stored as a separate file, binary files (which typically don't compress well even for apparently small changes) will quickly take up quite a bit of space in either object or pack form.

[Git Things](https://matklad.github.io/2023/12/31/git-things.html#Git-Things) - [Hacker News Discussion](https://news.ycombinator.com/item?id=38830194)

[I wish people would stop insisting that Git branches are nothing but refs](https://blog.plover.com/2023/02/27/) - [Hacker News Discussion](https://news.ycombinator.com/item?id=34965567)

[Useful git commands - Marc Garcia](https://datapythonista.me/blog/useful-git-commands.html) - more advanced Git shell commands.

[More productive Git](https://increment.com/open-source/more-productive-git/)

[Git from the inside out - Mary Rose Cook](https://codewords.recurse.com/issues/two/git-from-the-inside-out) - a deeper dive into how Git works under the hood.

[Git From the Bits Up - Tim Berglund](https://www.youtube.com/watch?v=MYP56QJpDr4)

[Git from the Bottom Up](https://jwiegley.github.io/git-from-the-bottom-up/)

[Deep Dive into Git - Edward Thomson](https://www.youtube.com/watch?v=dBSHLb1B8sw)

[Learn the workings of Git, not just the commands](https://developer.ibm.com/tutorials/d-learn-workings-git/)

[Things I think everyone should know about Git](https://perl.plover.com/classes/git-tips/) - [Things I wish everyone knew about Git (Part II)](https://blog.plover.com/prog/git/tips-2.html)

## Criticism

[What’s wrong with Git? A conceptual design analysis](https://blog.acolyer.org/2016/10/24/whats-wrong-with-git-a-conceptual-design-analysis/)

[Why SQLite Does Not Use Git](https://sqlite.org/whynotgit.html)

[Confusing git terminology](https://jvns.ca/blog/2023/11/01/confusing-git-terminology/) - [Hacker News Discussion](https://news.ycombinator.com/item?id=38112951)

The single thing that made everything "click" together is that most things are just pointers to commits: branch names, HEAD, tags, all of them are pointers.

The other thing caught me out multiple times is that most commands seem inconsistent because git assumes default arguments:

`git checkout file.txt` is the same as `git checkout HEAD -- file.txt`

When you're on `my-branch`, `git rebase main` is the same as `git rebase main my-branch`

## Rebasing

[git rebase: what can go wrong?](https://jvns.ca/blog/2023/11/06/rebasing-what-can-go-wrong-/)

2 different kinds of rebase - only one of them requires you to deal with merge conflicts.

1. rebasing on an ancestor, like git rebase -i HEAD^^^^^^^ to squash many small commits into one. As long as you’re just squashing commits, you’ll never have to resolve a merge conflict while doing this.
2. rebasing onto a branch that has diverged, like git rebase main. This can cause merge conflicts.

Undoing rebases is hard

---

A rebase based workflow requires two rebases

- rebase master onto feature (easier - integrating changes from stable master into feature)
- rebase feature back to master (or this could be a merge commit) (harder - more potential for conflicts if feature branch has diverged significantly)
- push master

## Revert

Undo commit with a new commit.

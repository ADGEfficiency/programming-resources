## Where am I?

Which directory am I in?

`pwd`

What is in this directory?

`ls`

`-a` show hidden files
`-G` colorized
`-l` long format
`-r` reverse order 
`-t` sort by time

`tree`
`-L {num}`

## Changing directories

`cd`

Getting to highest level folders by `cd /etc`, `cd /Users`

Going to the home folder (`/Users/adam`)

`cd ~`

Go back to last directory
```bash
cd -
```

Use the last argument from your previous command
```bash
mkdir mydir
rm -rf $_
```

## What is in this file?

`cat`

`head`

`tail`

`less` - uses vim bindings


## What is in this folder?

Show sizes of files in directory

```bash
du -hs *
```

Show disk usage

```bash
df -h
```


## Making new stuff

`mkdir`
`-p` recursive

`touch myfile.txt`


## Getting faster

`TAB` for autocomplete

Up and down arrows

`!python` - rerun last command for program

`history`

`<C-r>` history


## Setting variables

`env` is the equivalent of `dir()` in Python

`zz=1`

If I want to  see what this variable is (note the `$` - this is always used)

`echo $zz`

But these variables will not be inherited - to get this we need to use `export`

`export zz=2`

## PATH

Locations the shell checks when you type a command.  You can think of adding a location to your `PATH` as installing a program.

`echo $PATH | tr ":" "\n"`

`export PATH=$PATH:$SPARK_HOME/bin`

A common pattern you will see in install scripts

`echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc`

## Shebang

Telling the system which program to use to run the file

```
#!/usr/bin/env bash
```

Often will need to change permissions

```
$ chmod +x myfile
```

Now can run file without specifying the program
```bash
$ ./myfile
```

## Source

Running file / loading a file

```bash
source myfile
```

## Configuration

Your shell is configured using 

`~/.bashrc` (Linux)

`~/.bash_profile` (Mac - but Mac will also have a `bashrc`)

These scripts are run every time you start a new shell.  It is common to add `echo` statements to these files to get used to this idea.

## Aliases

"ls" to run without alias expansion

Useful aliases

```bash
alias ls='ls -aGl'

alias exut='exit'
alias eixt='exit'
alias exot='exit'
alias ext='exit'
alias eit='exit'
alias q='exit'

alias c='clear'
alias cls='clear && ls'
alias ctree='clear && tree'

alias bashrc='vim ~/git/dotfiles/.bashrc'

alias gs='git status'
alias ga='git add -u'
alias gc='git commit -m '
alias gp='git push origin '
alias gls='clear && git status'
```

## Redirect to file

Generate project structure for use in a readme

```
# append
tree >> out.txt

# new file
tree > out.txt
```

You can also put the redirection at the start

```bash
> out.txt tree
```

## Find a class/function in a project

```bash
grep -rl MyClass .
```

## Piping

```	
pip freeze | grep numpy
```

```
grep -rl LSTM . | grep -v __pycache__ | grep -v .ipynb_checkpoints
```

## SSH

The basic syntax for SSH is

```bash
ssh USER@HOSTNAME
```

Commonly if you are using AWS you will SSH while also passing your private key

```bash
ssh -i ~/.ssh/key.pem -tt ubuntu@ec2-54-93-188-105.eu-central-1.compute.amazonaws.com
```

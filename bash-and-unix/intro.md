# Bash

`$` indicates a command is run in the shell - you don't need to write this!

## Spaces

Shell uses space to separate things - this can complicate other times we want to use spaces
- expands by default (scripts will break with spaces)
- quotes to control expansion

```bash
$ "this is fine"

$ this will cause problems
```

## Where am I?

Which directory am I in?

```bash
$ pwd
```

What is in this directory?

```bash
$ ls
```

Useful options for `ls`:

```bash
-a show hidden files
-G colorized
-l long format
-r reverse order 
-t sort by time
```

Tree is a very useful program for showing the folder structure deeper in the file system

```bash
$ tree -L {num}
```

Clear the terminal
```bash
$ clear
```

## Making and editing files

Make an empty file

```bash
$ touch myfile.txt
```

Edit a file

```bash
$ nano myfile.txt
```


## What is in this file?

```bash
#  print file contents
$ cat readme.md

#  print first n rows
$ head -n 3 readme.md

#  print last n rows
$ tail -n 3 readme.md

#  paging over the file
$ less readme.md
```


## Making directories

Make a directory

```bash
$ mkdir practice-dir
```

We can also recursively create directories

```bash
$ mkdir -p practice/subfolder
```


## Moving stuff

Be careful with `mv` - it will overwrite the file!

```bash
$ cp myfile.txt practice-dir/copy.txt

$ mv myfile.txt practice-dir/my-file.txt
```


## Changing directories

Move down into a folder

```bash
$ cd practice-dir
```

To go one level up

```bash
$ cd ..
```

Go back to last directory
```bash
$ cd -
```

Getting to highest level folders by `cd /etc`, `cd /Users`

Going to the home folder (`/Users/adam`)

```bash
$ cd ~

$ cd $HOME

$ cd
```

Use the last argument from your previous command

```bash
$ mkdir mydir

$ tree $_
```

Run your last command

```bash
$ !!
```


## What is in this folder?

Show sizes of files in directory (the `*` symbol is a wildcard that matches everything)

```bash
$ du -hs *
```

Show disk usage

```bash
$ df -h
```

Make a file with a single line `tdd`

```bash
$ echo tdd > .python-version
```


## Removing stuff

Be careful with `rm` - there is no trash can for `rm`!

```bash
$ rm file

$ rm -rf directory
```


## Opening stuff

You can use the default program in your OS to open files

```bash
#  open the current folder in your OS's file explorer
$ open .
```


## Getting faster

`TAB` for autocomplete

Up and down arrows to move between commands

`$ !python` - rerun last command for program

`$ history` will print the history of your shell (the file is located at `~/.bash_history`)

`$ <C-r>` to search history

Aliases are also very important for improving speed (see below)


## Setting environment variables

The terminal is a stateful system - it has a whole bunch of variables.  You can see these using `env` (the equivalent of `dir()` in Python)

We can set a variable using:

```bash
$ zz=1
```

If I want to  see what this variable is (note the `$` - this is always used)

```bash
$ echo $zz
```

But these variables will not be inherited by sub processes - to get this we need to use `export`.  You will always see `export` used in the shell config scripts (i.e. `.bash_rc`), and the simpler variable assignment in shell scripts.

```bash
$ export zz=2
```


## Getting help

```bash
$ man ls
```


## Where is this thing?

```bash
$ which ls
```


## PATH

Locations the shell checks when you type a command.  You can think of adding a location to your `PATH` as installing a program.

`$ echo $PATH | tr ":" "\n"`

`$ export PATH=$PATH:$SPARK_HOME/bin`

A common pattern you will see in install scripts

`$ echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc`


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

Running file / loading a file into your bash environment

```bash
$ source myfile
```


## Configuration

Your shell is configured using 

`~/.bashrc` (Linux)

`~/.bash_profile` (Mac - but Mac will also have a `bashrc`)

These scripts are run every time you start a new shell.  It is common to add `echo` statements to these files to get used to this idea.

RC = a run command
- file that contains startup infomation


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

```bash
# append
$ tree >> out.txt

# new file
$ tree > out.txt
```

Another common pattern is generating a requirements file for a Python project

```bash
$ pip freeze > requirements.txt
```

You can also put the redirection at the start

```bash
$ > out.txt tree
```


## Find a class/function in a project

`grep` is one of the UNIX searching tools.

Search for the string "MyClass" inside a file, recursively, and return a list of files:

```bash
$ grep -rl "MyClass"" .
```

You can search by filename:

```bash
$ find . -name ".bashrc"
```


## Piping

```bash
$ pip freeze | grep numpy

$ grep -rl LSTM . | grep -v __pycache__ | grep -v .ipynb_checkpoints
```


## SSH

Very important skill to work on remote machines

The basic syntax for SSH is

```bash
$ ssh USER@HOSTNAME
```

Commonly if you are using AWS you will SSH while also passing your private key

```bash
$ ssh -i ~/.ssh/key.pem -tt ubuntu@ec2-54-93-188-105.eu-central-1.compute.amazonaws.com
```


## SSH tunneling for Jupyter

```bash
$ ssh -N -L localhost:8888:localhost:8888 $USER@$HOST
```


## Dotfiles repo

Common to backup your dotfiles on GitHub - [you can find my dotfiles here](https://github.com/ADGEfficiency/dotfiles).
- you can clone this onto a remote machine & source your dotfiles!


## `wget`

Downloads files served with HTTP, HTTPS, or FTP over a network

```bash
$ wget https://news.ycombinator.com/y18.gif
```


## Viewing `.csv` files

```bash
$ cat raw-data/specs.csv | column -t -s, | less -S
```

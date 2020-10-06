#  Tools

*What you need write and run computer programs*

![](assets/1803-antike-stadt-an-einem-Berg.jpg)

*Antike Stadt an einem Berg - Karl Friedrich Schinkel - 1803*


# Key takeaways

Use a toolset that you are comfortable with & enjoy using & maintaining 
- fill gaps, learn shortcuts & use a mouse less
- slowly add new tools as you feel comfortable

The basic toolset of a programmer includes
- text editor (to edit code)
- terminal (to run & install programs, move files)
- file manager & navigator (that can see hidden files (`.bashrc` etc)
- command line based editor (useful to edit files on remote machines)
- version control (git)

If you don't know where to start, choose either:
- JupyterLab
- VS Code

Other useful tools
- debugger (`pdb` in Python)
- linter (`black` for Python)
- profiler
- terminal mulitplexer (tmux, screen)


## Keyboard shortcuts

Useful editor shortcuts
- comment out a block of code
- jump to definition of a function/class
- jump to line number

Shell aliases
- probably the highest value productivity change a programmer can make

Look at what you spend lots of time doing / typing
- record your screen (replay 2x speed :)

Check what commands you use often on the shell:

```bash
#  bash
$ cat ~/.bash_history | sort | uniq -c | sor
#  zsh
$ awk -F ";" '{print $2}' ~/.zsh_history | sort | uniq -c | sort
```

I find post-it notes on my screen useful


# Tooling options for data science

## Notebooks

Locally with [Jupyter Lab 2.0](https://towardsdatascience.com/jupyterlab-2-0-edd4155ab897)
- common in data science
- an example of literate programming

A very recent trend in computing is free access to compute via notebook style interfaces
- Google Colab
- Kaggle kernels

You can often access GPU as well :)


## Text editor 

Possible features
- syntax highlighting
- linting / syntax / style checking
- find, find and replace
- autocomplete
- type / function argument hints
- top-bottom split (same file), left right split (different file)

Inline linting is very useful for learning proper code style
- very hard to learn without it

*Further reading*
- [The Era of Visual Studio Code](https://blog.robenkleene.com/2020/09/21/the-era-of-visual-studio-code/) - history of text editors

### GUI Text editor or IDE for a text editor

Text editor = edits text

IDE = integrated development environment

- lots of tools together in one program
- has tools to run, debug code
- usually language specific

The distinction between text editors and IDE's is somewhat vague

- text editors commonly used for programming almost always have IDE type components
- most IDE's have text editors

Commonly used programs

- VS Code (very popular, excellent ecosystem, Electron app)
- Atom (popular, not supported, Electron app) 
- Sublime (fast)
- PyCharm (Python specific, powerful, slow)
- Spyder (similar to R Studio)


### Terminal text editors

vim/emacs - often combined with a terminal multiplexer (iterm or screen)

Even if you use a GUI editor as you main editor, you will need to know the basics of one terminal editor that is widely available on remote servers (vim or nano)
- when you are SSH'd into a remote server, you may want to make small edits to files on the remote machine
- UNIX systems will come with a few for free - nano, vim
- worth knowing enough to edit a file just in case

Vim or nano?
- vim is the more powerful editor
- nano has a lower learning curve
- if you don't know, pick nano




## Terminals & Shells

Crucial part of using computers well
- allows automation & repetition (hard with a mouse)

### Terminal

A program that run-
Program to input / output text to a sh
- also called a *tty*

There are different terminal emulators
- Mac - [iTerm2](https://www.iterm2.com/) (some useful improvements to the default Terminal app)
- Windows - Windows Terminal (new!)
- Linux - default shell pretty good

If you want your shell to look pretty - check out [Powerline](https://github.com/b-ryan/powerline-shell) 
- customize the information your terminal shows
- to make your terminal pretty
- uses Python - can cause problems if you are activating your virtual env at the wrong time!

*Further reading*
- [The TTY demystified](https://www.linusakesson.net/programming/tty/)


### Shell

[Shell](https://en.wikipedia.org/wiki/Shell_(computing))

A program that processes commands & returns

There are different shell programs
- `bash` - standard, available everywhere
- `zsh` - now the default shell on macOS
- `fish` 

Features of a shell
- history
- autocompletion
- keyboard shortcuts (defualt is emacs style)


## How to use Jupyter Lab 

Modal editor
- undo versus undo cells

Kernel - restart & run all

Keyboard shortcuts
- `a`, `b`, `dd` are the most important

Split views
- notebooks, shell, file explorer

Good for data exploration, visualization and experiment logging/monitoring
- not good for testing, developing packages

**Best practice - refactor functions from notebooks into scripts**
- go through this with class (after setup)
- show `%%autoreload`

The Python that runs in your Notebook is not the same that runs when you access Python on the shell

- it's iPython!

iPython is a superset of Python, with some extra
- this is where the `%%` magic commands come from (useful are `%%run myscript.py`, `%% clear`, `%% history`)
- the `!` command (to run shell code)

```python
!ls
```

With `pip` we can use either as a shell command or directly in the notebook (below I tell pip to be quiet with a `-q`):


```python
!pip install --upgrade pip
```


## git

Minimum level of git
- don't use the GUI or web based Github client 
- `Add files via upload` is a sure sign of a newbie

**Don't download the files as a zip** - this is not how to use Github
- instead **clone** the repo using the **GitHub url** for the repo.  

Use the following in your shell:


```python
!git clone https://github.com/ADGEfficiency/programming-resources

#  removing the repo  
!rm -rf programming-resources
```


## Markdown

Markdown is a syntax used to format text in notebooks & in readme's on GitHub

```markdown
# Header 1

## Header 2

### Header 3

*italic*

**bold**

`code`

```


## LaTeX

LaTeX is syntax for producing scientific documentation

Use a `$` 

`$x^{2}$` -> $x^{2}$

`$x_{3}$` -> $x_{3}$

It will render in Notebooks


## Files

All files are text
- characters
- binary

File system naming
- The suffix doesn't change the data in a file 
- is used by programs to identify file type

Don't put spaces in file names
- use `-` where possible - python (`.py`) files all need `_`, but `-` is prettier


## The web

Web is a conversation between computers
- clients & servers
- server sends HTML, CSS & Javascript to your browser - JS runs in your browser

Javascript means that the server can send you code to run
- server versus client side compute


## The cloud

Server = a computer (CPU, memory, storage)
- mostly running Linux

AWS, Google Cloud (GCP), Azure
- AWS is the oldest
- Azure has a big advantage in business (Microsoft product)
- GCP has a $300 credit

Skillets required on the cloud
- shell (most likely bash)
- SSH, SSH keys, SSH tunnels

Common workflow
- spin up server
- SSH in
- clone a repo (for code)
- get data (S3)
- run Python scripts
- transfer data




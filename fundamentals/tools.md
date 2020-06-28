#  Tools

To write and execute programs on a computer

![](assets/1803-antike-stadt-an-einem-Berg.jpg)

*Antike Stadt an einem Berg - Karl Friedrich Schinkel - 1803*


# Key takeaways

Use a toolset that you are comfortable with & enjoy - while constantly trying to fill gaps, learn shortcuts & use a mouse less

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


# Options for data science

## Notebook server 

Locally with [Jupyter Lab 2.0](https://towardsdatascience.com/jupyterlab-2-0-edd4155ab897)
- common in data science

A very recent trend in computing is free access to compute via notebook style interfaces
- Google Colab
- Kaggle kernels


## GUI editor / IDE

VS Code or Atom 

IDE = lots of tools together in one program
- usually language specific
- Spyder (similar to R Studio)
- Pycharm
- Sublime


## Terminal only

tmux/screen + vim/emacs


## Text editor 

Possible features
- syntax highlighting
- linting / syntax / style checking
- find and replace
- autocomplete
- type / function argument hints
- top-bottom split (same file), left right split (different file)

Inline linting is very useful for learning proper code style
- very hard to learn without it


## Terminal

Crucial part of using computers well
- allows automation & repetition (hard with a mouse)

There are different shell languages
- `bash`, `zsh`, `fish` etc

There are different terminal emulators
- Mac - iTerm2
- Windows - Windows Terminal (new!)
- Linux - default shell is usually good

[Powerline](https://github.com/b-ryan/powerline-shell) 
- to make your shell pretty
- uses Python - can cause problems if you are activating your virtual env at the wrong time!


## Command line based editor

It is possible to run an editor directly inside the shell
- UNIX systems will come with a few for free - nano, vim
- worth knowing enough to edit a file just in case


## How to use Jupyter Lab / ipython

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

## Running shell code in your notebook

Prefix with `!`


```python
!ls
```

With `pip` we can use either as a shell command or directly in the notebook (below I tell pip to be quiet with a `-q`):


```python
!pip install --upgrade pip
```


## Minimum level of git

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


## Markdown 101

Markdown is a syntax used to format text in notebooks & in readme's on GitHub

```markdown
# Header 1

## Header 2

### Header 3

*italic*

**bold**

`code`

```


## LaTeX 101

LaTeX is syntax for producing scientific documentation

Use a `$` 

`$x^{2}$` -> $x^{2}$

`$x_{3}$` -> $x_{3}$


## File system naming

All files are text
- characters
- binary

The suffix doesn't change the data in a file - is used by programs to identify file type

Don't put spaces in file names

Use `-` where possible - python (`.py`) files all need `_`, but `-` is prettier


## The web

Server versus client side compute

Server sends HTML, CSS & Javascript to your browser - JS runs in your browser


## The cloud

Server = a computer (CPU, memory, storage)
- mostly running Linux

AWS, Google Cloud (GCP), Azure
- AWS is the oldest
- Azure has a big advantage in business (Microsoft product)
- GCP has a $300 credit

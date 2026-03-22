# Homebrew Essentials

## Core commands

brew install <formula>      # install a CLI tool/library
brew install --cask <app>   # install a GUI application
brew uninstall <formula>    # remove something
brew upgrade                # upgrade all installed packages
brew upgrade <formula>      # upgrade specific package
brew update                 # update homebrew itself and formulae list
brew search <term>          # find packages
brew info <formula>         # show details about a package
brew list                   # show all installed packages
brew doctor                 # diagnose issues

## Brewfile workflow

brew bundle dump            # generate Brewfile from currently installed packages
brew bundle                 # install everything in Brewfile
brew bundle cleanup         # uninstall anything not in Brewfile
brew bundle check           # verify all Brewfile deps are installed

## Brewfile syntax

# ~/.Brewfile or ./Brewfile
tap "homebrew/bundle"       # add a tap (third-party repo)
brew "git"                  # CLI formula
cask "firefox"              # GUI app
mas "Keynote", id: 409183694  # Mac App Store app (requires mas CLI)
vscode "ms-python.python"   # VS Code extension

## Useful patterns

brew bundle --global        # use ~/.Brewfile
brew bundle --file=./path   # specify Brewfile location
brew leaves                 # show top-level packages (not dependencies)
brew deps --tree <formula>  # show dependency tree

---

brew bundle list
brew bundle edit

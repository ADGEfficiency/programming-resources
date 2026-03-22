# mise Essentials

## Core commands

mise install                # install all tools defined in config
mise install <tool>@<ver>   # install specific tool version
mise use <tool>@<ver>       # install + add to mise.toml
mise use -g <tool>@<ver>    # install + add to global config
mise ls                     # list installed versions
mise ls-remote <tool>       # list available versions
mise current                # show active versions in current dir
mise prune                  # remove unused versions
mise upgrade                # upgrade all tools to latest

## Config files (checked in order)

mise.toml                   # project config (preferred)
mise.local.toml             # local overrides (gitignore this)
.tool-versions              # asdf-compatible format
~/.config/mise/config.toml  # global config

## mise.toml syntax

[tools]
node = "20"                 # latest 20.x
python = "3.12.0"           # exact version
go = "latest"               # latest stable
ruby = ["3.2", "3.3"]       # multiple versions
"npm:prettier" = "3"        # npm package
"go:github.com/a-h/templ/cmd/templ" = "latest"  # go install
"cargo:ripgrep" = "14"      # cargo install

[env]
DATABASE_URL = "postgres://localhost/dev"

[tasks]
build = "go build ./..."
test = "go test ./..."

## Backends (tool sources)

core (built-in)             # node, python, go, ruby, rust, java, etc.
asdf plugins                # anything asdf supports
npm:                        # npm -g install
go:                         # go install
cargo:                      # cargo install
pipx:                       # pipx install
ubi:                        # github releases

## Useful commands

mise trust                  # trust current directory's config
mise doctor                 # diagnose issues
mise reshim                 # rebuild shims after manual installs
mise exec <tool> -- <cmd>   # run command with tool available
mise run <task>             # run a task from mise.toml
mise watch <task>           # run task on file changes

## Shell setup

eval "$(mise activate bash)"   # add to .bashrc
eval "$(mise activate zsh)"    # add to .zshrc
mise activate fish | source    # add to config.fish

## .tool-versions syntax (asdf compat)

node 20.10.0
python 3.12.0
go 1.22

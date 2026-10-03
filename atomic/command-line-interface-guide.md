---
id: command-line-interface-guide
aliases: []
tags:
  - programming
---

[Command Line Interface Guidelines](https://clig.dev/)

Command line = versatile, can dive into details, creative interaction, available all laptops, interactive or automated, slower changing than the OS GUI

## Convention

Follow convention where possible

## Discoverable

Discoverable CLIs have comprehensive help texts, provide lots of examples, suggest what command to run next, suggest what to do when there is an error. There are lots of ideas that can be stolen from GUIs to make CLIs easier to learn and use, even for power users.

You can suggest possible corrections when user input is invalid, you can make the intermediate state clear when the user is going through a multi-step process, you can confirm for them that everything looks good before they do something scary.

## Delight

Exceeding expectations

## Use CLI parsing library where you can

Go: Cobra, cli
Python: Argparse, Click, Typer

## Exit codes

Return zero exit code on success, non-zero on failure. Exit codes are how scripts determine whether a program succeeded or failed, so you should report this correctly. Map the non-zero exit codes to the most important failure modes.

## Stdout

Send output to stdout. The primary output for your command should go to stdout. Anything that is machine readable should also go to stdout—this is where piping sends things by default.

## Stderr

Send messaging to stderr. Log messages, errors, and so on should all be sent to stderr. This means that when commands are piped together, these messages are displayed to the user and not fed into the next command.

## Help

Show concise help if command with no args

Show more docs if `--help` or `-h`

Lead with examples

Display most common flags first

## Docs

Provide web & terminal based documentation

## Output

Prioritize human readable output

`--plain`

`--json`

`-q` to suppress output

Tell user if you change state

Suggest commands to run (if a workflow)

Disable color if program is not run in terminal or `--no-color` or `NO_COLOR`

No animations if `stdout` in a non-interactive terminal

Don't put developer output there (if it serves only the developer, not the user)

## Errors

Catch errors and rewrite for humans

High signal, low noise errors

## Args vs flags

Argument = positional parameters

Flags = named parameters

Prefer flags over args

- clearer
- easier to change how you get input in future

Standard names if possible

Make defaults right for most users

Only accept password params from files (env vars are insecure)

## Subcommands

Usually `noun verb`

## config

Use XDG-spec

The precedence for config parameters, from highest to lowest:

    Flags
    The running shell’s environment variables
    Project-level configuration (e.g. .env)
    User-level configuration
    System wide configuration

## Env vars

Environment variables are for behavior that varies with the context in which a command is run. The “environment” of an environment variable is the terminal session—the context in which the command is running. So, an env var might change each time a command runs, or between terminal sessions on one machine, or between instantiations of one project across several machines.

Do not read secrets from environment variables.

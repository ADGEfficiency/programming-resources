---
id: lazygit
aliases: []
tags: []
---

# Cheat Sheet

## Moving Around

`TAB` or `h l` = Switch between left panels

`j k` = move up down inside left panel

`J K` = move up down inside right panel

`[ ]` = move between tabs in one left panel

## Look at History of One File

`<c-s>` search for a file

## Status panel

`1` = status panel

`a` log over all branches

## Files panel

`2` = files

`a` = stage / unstage all files

`space` = stage / unstage one file

`c` = commit

`s` = stash entire wortree

## Branches panel

`3` = branches

`space` = checkout branch

`p` = pull

`P` = push

`n` = new branch

## Commits panel

`4` = commits

`s` = squash - fold down commit, keeping message

`f` = fold down, discarding amment

## Stash panel

`5` = stash

`enter` = view stash

`space` = apply without removing from stash

`g` = apply and remove from stash

`d` = delete


---

https://oliverguenther.de/2021/04/lazygit-an-introduction-series/

[The (lazy) Git UI You Didn't Know You Need - @bwplotka](https://www.bwplotka.dev/2025/lazygit/)

This means that q will quit the tool, h/j/k/l (or arrows) are for navigation, / for filtering and y for copy.

Similar to vim it attempts to follow the name of the command, e.g. c commits, a adds all, A amends, f fetches, p pulls, P pushes, r rebases.

Actions context dependent, are in the bottom row!!!

Layout

- right panel `Work` view depends on the focused box (diff for a file, log for a branch, diff for commit)

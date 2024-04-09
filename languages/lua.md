[Lua, a misunderstood language • AndreGarzia.com](https://andregarzia.com/2021/01/lua-a-misunderstood-language.html)

[LÖVE - Free 2D Game Engine](https://love2d.org/)

# Lua in Neovim

[Lua - Neovim docs](https://neovim.io/doc/user/lua.html)

[Lua-guide - Neovim docs](https://neovim.io/doc/user/lua-guide.html)

Run Lua scripts with Neovim:

```shell-session
$ nvim -l script.lua
```

Run a Lua script inside Neovim with:

```
:luafile script.lua
```

Source a Lua script with:

```
:source script.lua
```

Run current file:

```
:luafile %
```

Run a Lua command over each line in a file with:

```
:luado return print("line: ", line)
```

Run a lua command with `vim.print`:

```
lua =vim.opt.wildignore
```

## Vimscript

Run a Vimscript command:

```
vim.cmd("colorscheme habamax")
```

Run Vimscript functions:

```
vim.fn
```

## Strings

String literal with `[[]]`:

```
vim.cmd([[%s/\Vfoo/bar/g]])
```

Can use multiple lines:

```
vim.cmd([[
  highlight Error guibg=red
  highlight link Warning Error
]])
```

## Tables

Object or container data structure.  Represent both list and maps.

## Closures

Each scope is a closure:

- functions,
- modules,
- `do` blocks.

## Coroutines

Stackful coroutines enable multi-threading, generators & control for both Lua & Neovim.

## Looping

Loop over list:

```lua
local fruits = { "apple", "banana", "cherry" }
for index, value in ipairs(fruits) do
	print(index, value)
end
```

```lua
local colors = {
    red = "#FF0000",
    green = "#00FF00",
    blue = "#0000FF"
}
for key, value in pairs(colors) do
    print(key, value)
end
```

## Functions

Running a function without an argument makes that argument `nil`:

```lua
local func = function(a, b)
	print("A: ", a)
	print("B: ", b)
end

func()
func(1)
func(1, 2)
```

You can expand out keywords:

```lua
local opts_func = function(opts)
	print("opts_func")
	print("A: ", opts.a)
	print("B: ", opts.b)
end

opts_func({ a = 1, b = 2 })
```

## Regex

Can use Vim regex:

```lua
-- %d+ = one or more digits, matches first sequence
print(string.match("foo123bar123", "%d+"))

-- [^%d]+ = one or more non-digit characters
print(string.match("foo123bar123", "[^%d]+"))

-- [abc]+ = one or more of a, b, or c
print(string.match("foo123bar123", "[abc]+"))

-- %.bar = literal dot and bar
print(string.match("foo.bar", "%.bar"))
```

## Modules

Searched for under the `runtimepath.` `.` used to separate directories.

`require` is used to run a module.

You can see current runtime path in Neovim with:

```
print(vim.o.runtimepath)
```

## The Neovim Standard Library

Accessible as `vim`.

Get help:

```command
:help vim.deepcopy()
```

## JSON

Decode JSON:

```
vim.print(vim.json.decode('{"foo": "bar"}'))
```

## Options

```
vim.o.number = true
vim.opt.number = true

vim.opt.wildignore:append("*.o")
vim.opt.wildignore:prepend("*.o")
vim.opt.wildignore:remove("*.o")
```

```
print(vim.o.wildignore)
vim.print(vim.opt.wildignore)
```

## Variables

Variables can be set and read using the following wrappers, which directly correspond to their variable-scope:

vim.g: global variables (g:)
vim.b: variables for the current buffer (b:)
vim.w: variables for the current window (w:)
vim.t: variables for the current tabpage (t:)
vim.v: predefined Vim variables (v:)
vim.env: environment variables defined in the editor session 

Target buffer number 2:

```
vim.b[2].myvar = 1
```

## Autocommands

`vim.apt.nvim_create_autocmd` takes two arguments:

- `event` - table of events to listen for,
- `opts` - controls what happens when events trigger.

Important options are:

- `pattern` - file patterns to match,
- `command` - the Vim command,
- `callback` - a Lua function,
- `desc` - a description.

```lua
vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"}, 
  {
      pattern = {"*.c", "*.h"},
      callback = function() print("Entering a C or C++ file") end
  })
```

The callback function will be called with a table containing info about the autocommand:

- `match`: a string that matched the pattern,
- `buf`: the number of the buffer the event was triggered in,
- `file`: the file name of the buffer the event was triggered in,
- `data`: a table with other relevant data that is passed for some events.

## Autocommand Groups

```lua
local mygroup = vim.api.nvim_create_augroup('vimrc', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html',
  group = mygroup,
  command = 'set shiftwidth=4',
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.html',
  group = 'vimrc',  -- equivalent to group=mygroup
  command = 'set expandtab',
})
```

## User Commands

```lua
vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})
vim.cmd.Test()
--> It works!
```

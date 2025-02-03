## Installation

cd dotfiles
chmod +x bin/makesymlinks
./bin/makesymlinks
```

This will symlink all of the files and folders inside `dots/` into your home 
folder prefixed by `.` and everything from `config/` to your `~/.config/` 
folder.

The next time you start `vim`, it will automatically install `lazy.nvim` and Vim 
plugins. You should run `:MasonInstallAll` in order to install the required 
external programs. Also, check out 
[`packages_list.md`](./resources/packages_list.md) for extra programs to 
install.

The utility scripts in `bin/` are automatically added to the Zsh path, so you 
can run `makesymlinks` anywhere.


## Update

```bash
git pull
```

Maybe run `./bin/makesymlinks` again.


## Neovim configuration structure

The Neovim configuration is split into many files and is located in 
[`config/nvim/`](./config/nvim).

* [`autoload/`](./config/nvim/autoload): functions that are used in other files 
  and can be autoloaded. I still have a few functions here that I haven't 
  converted to Lua.
* [`ftplugin/`](./config/nvim/ftplugin): configuration for specific file types
* [`lua/j/`](./config/nvim/lua/j): Lua files for settings, mappings, and my own 
  modules
* [`lua/j/plugins/`](./config/nvim/lua/j/plugins): configuration of plugins
* [`lua/j/plugins/lsp/`](./config/nvim/lua/j/plugins/lsp): configuration for 
  Neovim's built-in LSP
* [`init.lua`](./config/nvim/init.lua): basic settings and requiring other files

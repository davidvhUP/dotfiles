These are the dotfiles for all my configs.

# Neovim
```
~/.config/nvim
├── after
│   └── ftplugin
│       └── markdown.lua
├── init.lua
├── lua
│   ├── config
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── appearance.lua
│       ├── coding.lua
│       ├── debug.lua
│       ├── files.lua
│       ├── lsp.lua
│       ├── R.lua
│       ├── secondBrain.lua
│       └── writing.lua
├── main
├── pickle_fun.py
└── spell
    ├── en.utf-8.add
    └── en.utf-8.add.spl

```

`init.lua`
This is the central hub for the config. Here, all config and plugins are called from other sub-directories. 
This file also contains a block that remembers folds in files to save them between sessions

`/after/ftplugin/`
- `markdown.lua`
    - Sets `conceallevel` to enable the rendering of markdown formatting from Obsidian notes.

`/lua/config`
- `keymaps.lua`
    - Contains all keymaps 
- `lazy.lua`
    - Bootstrap lazy.nvim to install and use plugins
- `options.lua`
    - Contains some miscellaneous formatting options
    - 'bufferline' plugin used to add buffer tabs
    - 'remember folds' another config to remember folds?

`/lua/plugins`
- `appearance.lua`

These are the dotfiles for all my configs.

# Neovim
```
~/.config/nvim
├── after
│   └── ftplugin
│       └── markdown.lua
├── init.lua
└── lua
    ├── config
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── R.lua
        ├── appearance.lua
        ├── coding.lua
        ├── debug.lua
        ├── files.lua
        ├── lsp.lua
        ├── secondBrain.lua
        └── writing.lua
```
`/after/ftplugin/markdown.lua`
Sets `conceallevel` to enable the rendering of markdown formatting from Obsidian notes.

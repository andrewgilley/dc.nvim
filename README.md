# dc.nvim

A self-contained Neovim colorscheme based on the official
[Dracula](https://draculatheme.com/) palette. Every palette color is varied once
per Neovim session by up to 5 RGB levels per channel (about 2%).

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "andrewgilley/dc.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("dc").setup({
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    })

    vim.cmd.colorscheme("dc")
  end,
}
```

The `setup` call is optional.

## Features

- Dracula palette with subtle per-session variation
- Tree-sitter and semantic syntax highlighting
- LSP diagnostics and references
- GitSigns, Telescope, blink.cmp, and nvim-cmp highlights
- Matching Neovim terminal colors
- Optional transparent background

Dracula is created by [Zeno Rocha](https://zenorocha.com/) and contributors and
is distributed under the MIT license.

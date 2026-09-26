# darkmonochrome.nvim

A restrained, grayscale-first Neovim colorscheme built from the Dark Monochrome palette. The interface stays deliberately quiet; desaturated color is reserved for diagnostics, Git changes, syntax, and terminal semantics.

## Requirements

Neovim 0.9+

## Installation with Lazy.nvim / LazyVim

```lua
{
  "daverussell13/darkmonochrome.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

Then select it in your LazyVim configuration:

```lua
-- lua/plugins/colorscheme.lua
return {
  { "LazyVim/LazyVim", opts = { colorscheme = "darkmonochrome" } },
}
```

Or load it directly:

```lua
require("darkmonochrome").setup()
vim.cmd.colorscheme("darkmonochrome")
```

## Configuration

Call `setup` before loading the colorscheme.

```lua
require("darkmonochrome").setup({
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },
  -- Mutate the palette before highlights are generated.
  on_colors = function(colors)
    -- colors.bg = "#000000"
  end,
  -- Add or replace highlight groups.
  on_highlights = function(highlights, colors)
    -- highlights.CursorLine = { bg = colors.surface_hover }
  end,
})
vim.cmd.colorscheme("darkmonochrome")
```

## Palette

- Background: `#080808`
- Surface: `#121212`
- Primary text: `#C0C0C0`
- Maximum emphasis: `#FFFFFF`

Semantic colors are intentionally muted: green for success/additions, yellow for warnings, red for errors/deletions, and blue for information/changes. Editor roles (cursor line, selection, search, hint, debug, and Git/diff states) are named aliases of existing palette values; no additional colors are introduced.

## Supported highlights

The scheme includes core Vim syntax and UI groups, Tree-sitter, LSP semantic tokens and diagnostics, Git signs, Telescope, WhichKey, Lazy.nvim, Snacks, Noice, nvim-notify, nvim-cmp, neo-tree, and bufferline.

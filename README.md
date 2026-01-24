# Neovim Config

Personal neovim configuration using lazy.nvim as package manager.

## Install

```bash
git clone git@github.com:schoblaska/neovim.git
ln -sf ~/path/to/neovim ~/.config/nvim
```

## Features

- **Flash** - Jump anywhere with `s`
- **TreeSJ** - Split/join code blocks with `gS`
- **Gitlinker** - Copy GitHub URLs for current line
- **Indent-blankline** - Visual indent guides
- **Hlslens** - Enhanced search highlighting
- **Conform** - Auto-formatting on save

## Telescope

File finding and searching with fuzzy matching.

| Key | Action |
|-----|--------|
| `<leader>t` | Find files |
| `<leader>a` | Live grep (visual mode: grep selection) |
| `<leader>j` | Jumplist (project only) |
| `<leader>f` | File browser at current file |
| `<leader>gs` | Git status |
| `<C-o>` | Quote prompt (in live grep) |

## Diffview

Git diff viewer that opens in a dedicated tab.

| Key | Action |
|-----|--------|
| `<leader>gd` | Open diffview |
| `<leader>gh` | File history |
| `s` | Stage/unstage file |
| `j` / `k` | Navigate entries |
| `l` | Preview file |
| `<tab>` | Toggle file panel |
| `<cr>` | Open file and close diffview |
| `q` | Close diffview |

## LSP

Mason-managed language servers with nvim 0.11+ native config.

- **ruby_lsp** - Auto-installed via Mason
- Hover: Rounded borders, `K` to show
- Diagnostics: Custom icons in sign column

## Gitsigns

Git change indicators in the sign column.

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next/prev hunk |
| `<leader>hh` | Preview hunk inline |
| `<leader>hs` | Stage hunk (visual: stage selection) |
| `<leader>hr` | Reset hunk |
| `<leader>hu` | Undo stage |

## Nightfox

Theme with automatic light/dark mode switching based on system appearance.

- **Dark**: duskfox
- **Light**: dayfox

## Lazygit

Full-screen lazygit integration.

| Key | Action |
|-----|--------|
| `<leader>lg` | Open lazygit |

## Global Keymaps

| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to clipboard |
| `<leader>fc` | Copy file path |
| `<leader>1-9` | Switch to tab 1-9 |
| `<leader>0` | New tab |
| `<Tab>` | Next window |
| Arrow keys | Move between splits |
| `af` | Select entire file (visual/operator) |

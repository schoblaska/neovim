# Neovim Config

Personal neovim configuration using lazy.nvim as package manager.

## Install

```bash
git clone git@github.com:schoblaska/neovim.git
ln -sf ~/path/to/neovim ~/.config/nvim
```

## Telescope

File finding and searching with fuzzy matching.

| Key | Action |
|-----|--------|
| `<leader>t` | Find files |
| `<leader>a` | Live grep (visual mode: grep selection) |
| `<leader>j` | Jumplist (project only) |
| `<leader>f` | File browser at current file |
| `<C-o>` | Quote prompt (in live grep) |

## Diffview

Git diff viewer that opens in a dedicated tab.

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
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

## Flash

Jump anywhere on screen.

| Key | Action |
|-----|--------|
| `s` | Jump to any visible location |

## TreeSJ

Split/join code blocks (arrays, hashes, argument lists, etc.).

| Key | Action |
|-----|--------|
| `<leader>sj` | Toggle split/join |

## Gitlinker

Copy GitHub URLs for current file or selection.

| Key | Action |
|-----|--------|
| `<leader>gu` | Copy file URL |
| `<leader>gu` (visual) | Copy URL with line range |

## Hlslens

Enhanced search highlighting with match count display.

| Key | Action |
|-----|--------|
| `n` / `N` | Next/prev match |
| `*` / `#` | Search word under cursor |
| `<Esc>` | Clear search highlight |

## Indent-blankline

Visual indent guides. Automatic, no keymaps.

## Conform

Auto-formatting on save.

- **json** - formatted via jq
- **ruby** - formatted via LSP

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

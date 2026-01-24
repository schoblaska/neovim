# Neovim Config

Personal neovim configuration using lazy.nvim as package manager.

## Install

```bash
git clone git@github.com:schoblaska/neovim.git
ln -sf ~/path/to/neovim ~/.config/nvim
```

## Telescope

File finding and searching with fuzzy matching.

- `<leader>t` - Find files
- `<leader>a` - Live grep (visual: grep selection)
  - `<C-o>` - Quote prompt
- `<leader>j` - Jumplist (project only)
- `<leader>f` - File browser at current file
  - `<Left>` - Go to parent directory

## Diffview

Git diff viewer that opens in a dedicated tab.

- `<leader>gs` - Git status
- `<leader>gh` - File history
- In file panel:
  - `s` - Stage/unstage file
  - `j` / `k` - Navigate entries
  - `l` - Preview file
  - `<tab>` - Toggle file panel
  - `<cr>` - Open file and close diffview
  - `q` - Close diffview

## LSP

Mason-managed language servers with nvim 0.11+ native config.

- **ruby_lsp** - Auto-installed via Mason
- `K` - Hover (rounded borders)
- Diagnostics: Custom icons in sign column

## Gitsigns

Git change indicators in the sign column.

- `]h` / `[h` - Next/prev hunk
- `<leader>hh` - Preview hunk inline
- `<leader>hs` - Stage hunk (visual: stage selection)
- `<leader>hr` - Reset hunk
- `<leader>hu` - Undo stage

## Nightfox

Theme with automatic light/dark mode switching based on system appearance.

- **Dark**: duskfox
- **Light**: dayfox

## Lazygit

Full-screen lazygit integration.

- `<leader>lg` - Open lazygit

## Flash

Jump anywhere on screen.

- `s` - Jump to any visible location

## TreeSJ

Split/join code blocks (arrays, hashes, argument lists, etc.).

- `<leader>sj` - Toggle split/join

## Gitlinker

Copy GitHub URLs for current file or selection.

- `<leader>gu` - Copy file URL
- `<leader>gu` (visual) - Copy URL with line range

## Hlslens

Enhanced search highlighting with match count display.

- `n` / `N` - Next/prev match
- `*` / `#` - Search word under cursor
- `<Esc>` - Clear search highlight

## Indent-blankline

Visual indent guides. Automatic, no keymaps.

## Conform

Auto-formatting on save.

- **json** - formatted via jq
- **ruby** - formatted via LSP

## Global Keymaps

- `<leader>y` - Yank to system clipboard
- `<leader>Y` - Yank line to clipboard
- `<leader>fc` - Copy file path
- `<leader>1-9` - Switch to tab 1-9
- `<leader>0` - New tab
- `<Tab>` - Next window
- Arrow keys - Move between splits
- `af` - Select entire file (visual/operator)

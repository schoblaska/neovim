# Neovim Config

Personal neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as package manager.

## Install

```bash
git clone git@github.com:schoblaska/neovim.git
ln -sf ~/path/to/neovim ~/.config/nvim
```

## [Oil](https://github.com/stevearc/oil.nvim)

File explorer that lets you edit your filesystem like a buffer.

- `-` - Open parent directory (or go up in oil)
- `<cr>` - Open file/directory
- Standard vim motions to rename, delete, etc.
- `:w` - Save changes (no confirmation for simple edits)

## [Telescope](https://github.com/nvim-telescope/telescope.nvim)

File finding and searching with fuzzy matching.

- `<leader>t` - Find files
- `<leader>a` - Live grep (visual: grep selection)
  - `<C-o>` - Quote prompt
  - Supports ripgrep flags: `-g '*.lua'` (glob), `-g '!*.md'` (exclude), `-tpy` (file type), `-Tjs` (exclude type)
- `<leader>j` - Jumplist (project only)
- `<leader>fo` - Browse folders (opens in oil)

## [Diffview](https://github.com/sindrets/diffview.nvim)

Git diff viewer that opens in a dedicated tab.

- `<leader>gs` - Git status
- `<leader>gh` - File history (current file)
- `<leader>gH` - Branch history (all commits)
- `<leader>gp` - PR review (compare to origin/main)
- `<leader>gS` - Search commits (git log -G)
- File panel (git status):
  - `s` - Stage/unstage file
  - `j` / `k` - Navigate entries
  - `l` - Preview file
  - `<tab>` - Toggle file panel
  - `<cr>` - Open file and close diffview
  - `q` - Close diffview
- File history panel:
  - `j` / `k` - Navigate commits
  - `l` - Preview commit diff
  - `L` - Show commit message (`:q` to close)
  - `y` - Copy commit hash
  - `<tab>` - Toggle file panel
  - `q` - Close diffview

## [LSP](https://github.com/williamboman/mason.nvim)

Mason-managed language servers with nvim 0.11+ native config.

- **ruby_lsp** - Auto-installed via Mason
- `K` - Hover (rounded borders)
- Diagnostics: Custom icons in sign column

## [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

Git change indicators in the sign column.

- `]h` / `[h` - Next/prev hunk
- `<leader>hh` - Preview hunk inline
- `<leader>hs` - Stage hunk (visual: stage selection)
- `<leader>hr` - Reset hunk
- `<leader>hu` - Undo stage

## [Nightfox](https://github.com/EdenEast/nightfox.nvim)

Theme with automatic light/dark mode switching based on system appearance.

- **Dark**: duskfox
- **Light**: dayfox

## [Lazygit](https://github.com/folke/snacks.nvim)

Full-screen lazygit integration.

- `<leader>lg` - Open lazygit

## [Flash](https://github.com/folke/flash.nvim)

Jump anywhere on screen.

- `s` - Jump to any visible location

## [TreeSJ](https://github.com/Wansmer/treesj)

Split/join code blocks (arrays, hashes, argument lists, etc.).

- `<leader>sj` - Toggle split/join

## [Gitlinker](https://github.com/ruifm/gitlinker.nvim)

Copy GitHub URLs for current file or selection.

- `<leader>gu` - Copy file URL
- `<leader>gu` (visual) - Copy URL with line range

## [Hlslens](https://github.com/kevinhwang91/nvim-hlslens)

Enhanced search highlighting with match count display.

- `n` / `N` - Next/prev match
- `*` / `#` - Search word under cursor
- `<Esc>` - Clear search highlight

## [Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

Visual indent guides. Automatic, no keymaps.

## [Conform](https://github.com/stevearc/conform.nvim)

Auto-formatting on save.

- **json** - formatted via jq
- **ruby** - formatted via LSP

## [Bqf](https://github.com/kevinhwang91/nvim-bqf)

Better quickfix with preview and fuzzy search.

- `<leader>qf` - Open quickfix list
- `]q` / `[q` - Next/prev quickfix item
- In quickfix window:
  - `<cr>` - Open and close quickfix
  - `o` - Open and keep quickfix
  - `p` - Toggle preview
  - `zf` - Fuzzy search results
  - `q` - Close quickfix

Populate quickfix from:
- Telescope: `<C-q>` sends results to quickfix
- LSP: `:lua vim.diagnostic.setqflist()`
- Grep: `:grep pattern` or `:vimgrep /pattern/ **/*`

## Global Keymaps

- `<leader>y` - Yank to system clipboard
- `<leader>Y` - Yank line to clipboard
- `<leader>fc` - Copy file path
- `<leader>1-9` - Switch to tab 1-9
- `<leader>0` - New tab
- `<Tab>` - Next window
- Arrow keys - Move between splits
- `af` - Select entire file (visual/operator)

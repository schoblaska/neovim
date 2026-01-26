# Neovim Config

Neovim dotfiles using [lazy.nvim](https://github.com/folke/lazy.nvim) as package manager.

## Install

```bash
git clone git@github.com:schoblaska/neovim.git
ln -sf ~/path/to/neovim ~/.config/nvim
```

## Try without overwriting your config

```bash
git clone git@github.com:schoblaska/neovim.git ~/.config/schoblaska.nvim
NVIM_APPNAME=schoblaska.nvim nvim
```

This uses an isolated config directory (`~/.config/schoblaska.nvim`) and separate data/state/cache dirs (`~/.local/share/schoblaska.nvim`, etc.).

## [Diffview](https://github.com/sindrets/diffview.nvim)

<img width="1511" height="866" alt="Screenshot 2026-01-24 at 8 24 57 PM" src="https://github.com/user-attachments/assets/16501bb7-39be-48dc-881d-43998e44a934" />

*File panel*

<img width="1508" height="909" alt="Screenshot 2026-01-24 at 8 22 27 PM" src="https://github.com/user-attachments/assets/8ad1d0e3-8114-4aa2-b69c-8d5aaa5bc4d3" />

*File history panel*

Git diff viewer that opens in a dedicated tab.

- `<leader>gs` - Git status
- `<leader>gh` - File history (current file)
- `<leader>gH` - Branch history (all commits)
- `<leader>gp` - PR review (compare to origin/main)
- `<leader>gS` - Search commits (git log -G)
- `<leader>gc` - Show commit (by hash)
- File panel (git status):
  - `s` - Stage/unstage file
  - `d` - Discard changes
  - `j` / `k` - Navigate entries
  - `o` - Preview file
  - `<tab>` / `<s-tab>` - Next/prev file
  - `-` - Toggle file panel
  - `<cr>` - Open file and close diffview
  - `q` - Close diffview
- File history panel:
  - `j` / `k` - Navigate commits
  - `o` - Preview file diff
  - `<tab>` / `<s-tab>` - Next/prev file
  - `-` - Toggle history panel
  - `L` - Show commit message (`:q` to close)
  - `y` - Copy commit hash
  - `q` - Close diffview

## [Bqf](https://github.com/kevinhwang91/nvim-bqf)

<img width="1511" height="877" alt="Screenshot 2026-01-24 at 8 26 11 PM" src="https://github.com/user-attachments/assets/e906d9b0-2db0-40fb-a5af-05d3255ee27c" />

Better [quickfix](https://neovim.io/doc/user/quickfix.html) with preview and fuzzy search.

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

## [Oil](https://github.com/stevearc/oil.nvim)

File explorer that lets you edit your filesystem like a buffer.

- `-` - Open parent directory (or go up in oil)
- `<cr>` - Open file/directory
- Standard vim motions to rename, delete, etc.
- `:w` - Save changes (no confirmation for simple edits)

## [Telescope](https://github.com/nvim-telescope/telescope.nvim)

<img width="1508" height="874" alt="Screenshot 2026-01-24 at 8 37 14 PM" src="https://github.com/user-attachments/assets/1502767f-0a96-4a87-9d23-02434b47a7a1" />

File finding and searching with fuzzy matching.

- `<leader>t` - Find files
- `<leader>a` - Live grep (visual: grep selection)
  - `<C-o>` - Quote prompt
  - Supports ripgrep flags: `-g '*.lua'` (glob), `-g '!*.md'` (exclude), `-tpy` (file type), `-Tjs` (exclude type)
- `<leader>j` - Jumplist
- `<leader>fo` - Browse folders (opens in oil)

## [LSP](https://github.com/williamboman/mason.nvim)

Language servers with nvim 0.11+ native config.

- **ruby_lsp** - Ruby language server
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover (rounded borders)
- Diagnostics: Custom icons in sign column

## [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

<img width="1509" height="902" alt="Screenshot 2026-01-25 at 11 25 53 AM" src="https://github.com/user-attachments/assets/67b9953e-883c-4e28-bb4e-428ad519d5cf" />

Git change indicators in the sign column. Untracked files show a dashed line.

- `]h` / `[h` - Next/prev hunk
- `<leader>hh` - Preview hunk inline
- `<leader>hs` - Stage hunk (visual: stage selection)
- `<leader>hr` - Reset hunk
- `<leader>hu` - Undo stage

## [Blame.nvim](https://github.com/FabijanZulj/blame.nvim)

<img width="1508" height="902" alt="Screenshot 2026-01-25 at 11 30 11 AM" src="https://github.com/user-attachments/assets/6a7fd3bd-d540-4a57-b5af-202f78846094" />

Git blame with Diffview integration.

- `<leader>gb` - Toggle git blame (window view)
- `<CR>` - Open commit in Diffview
- `i` - Commit info popup
- `<tab>` / `<backspace>` - Navigate file history stack
- `q` / `<esc>` - Close

## [Nightfox](https://github.com/EdenEast/nightfox.nvim)

Theme automatic switching between [Dayfox](https://user-images.githubusercontent.com/2746374/210672782-6b8690d0-3ef5-4f32-bdea-4f0a97b9d9d5.png) for light mode and [Duskfox](https://user-images.githubusercontent.com/2746374/158456284-b6ff583f-c0bb-417c-b2d5-60b8364049a7.png) for dark mode.

## [Copilot](https://github.com/github/copilot.vim)

AI-powered code completion with ghost text suggestions.

- `<Tab>` (insert) - Accept suggestion
- Ghost text appears as you type

Requires GitHub Copilot subscription ($10/mo). Run `:Copilot setup` to authenticate.

## [Lazygit](https://github.com/jesseduffield/lazygit)

<img width="1505" height="890" alt="Screenshot 2026-01-24 at 9 07 37 PM" src="https://github.com/user-attachments/assets/cac88818-cfa7-4c4e-9d77-543a62c27e1b" />

Full-screen lazygit integration.

- `<leader>lg` - Open lazygit

## [Flash](https://github.com/folke/flash.nvim)

<img width="1511" height="862" alt="Screenshot 2026-01-24 at 8 43 56 PM" src="https://github.com/user-attachments/assets/83d1c48c-efb9-48c7-a2a3-9bfd139f95c9" />

*Jump to any visible location*

<img width="1510" height="872" alt="Screenshot 2026-01-24 at 8 43 11 PM" src="https://github.com/user-attachments/assets/4ad70ba1-8247-48a7-94c2-99671a9213de" />

*Treesitter select*

<img width="1510" height="871" alt="Screenshot 2026-01-24 at 9 30 41 PM" src="https://github.com/user-attachments/assets/8628bfda-c924-48ac-bbc0-f566a1bf2cff" />

*f/t motion target labels*

Jump anywhere on screen.

- `s` - Jump to any visible location
- `S` - Treesitter select (rainbow-colored node labels)
- `f/t/F/T` - Enhanced with labels for all matches (e.g., `ct)` shows labels for all `)` chars)

## [Treesitter Textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

Select code by semantic units.

- `au` / `iu` - Around/inner function
- `ab` / `ib` - Around/inner block

## [TreeSJ](https://github.com/Wansmer/treesj)

Split/join code blocks (arrays, hashes, argument lists, etc.).

- `<leader>sj` - Toggle split/join

## [Surround](https://github.com/kylechui/nvim-surround)

Add, change, delete surrounding pairs.

- `ys{motion}{char}` - Add surround (e.g., `ysiw)` wraps word in parens)
- `cs{old}{new}` - Change surround (e.g., `cs"'` changes `"` to `'`)
- `ds{char}` - Delete surround (e.g., `ds)` removes parens)
- `s{char}` (visual) - Surround selection
- Aliases: `a`=angle, `p`=paren, `c`=curly, `b`=bracket, `q`=quote, `s`=any

## [Substitute](https://github.com/gbprod/substitute.nvim)

Replace text with register contents.

- `X{motion}` - Replace motion with register (e.g., `Xiw` replaces word)
- `XX` - Replace line with register
- `X` (visual) - Replace selection with register

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

## Global Keymaps

- `<leader>y` - Yank to system clipboard
- `<leader>Y` - Yank line to clipboard
- `<leader>fc` - Copy file path
- `<leader>1-9` - Switch to tab 1-9
- `<leader>0` - New tab
- `<Tab>` - Next window
- Arrow keys - Move between splits
- `af` - Select entire file (visual/operator)

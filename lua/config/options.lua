-- Options ported from nvim.old/lua/opts.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = false

-- Clipboard
opt.clipboard = "" -- don't link nvim and system clipboard

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 3
opt.signcolumn = "yes"
opt.showmode = false
opt.showcmd = false
opt.showtabline = 1 -- show tabline only when n tabs > 1
opt.pumheight = 10
opt.colorcolumn = "99999"
opt.conceallevel = 0
opt.winbar = "%=%f" -- file path, right-aligned

-- Editing
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.wrap = true
opt.linebreak = true -- wrap on word boundaries
opt.breakindent = true -- preserve indentation on wrapped lines

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Mouse
opt.mouse = "a"
opt.mousescroll = "ver:6,hor:6"

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Timing
opt.timeoutlen = 500
opt.ttimeoutlen = 5
opt.updatetime = 300

-- Misc
opt.hidden = true
opt.fileencoding = "utf-8"
opt.title = true
opt.titlestring = "%<%F%=%l/%L - nvim"

-- Markdown
vim.g.markdown_recommended_style = 0

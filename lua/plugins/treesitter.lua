return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "ruby", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["au"] = "@function.outer",
          ["iu"] = "@function.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
    },
  },
}

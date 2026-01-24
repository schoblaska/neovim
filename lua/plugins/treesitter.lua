return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "ruby", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true }
  }
}

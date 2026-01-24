return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>sj", "<cmd>TSJToggle<cr>", desc = "Split/Join" },
  },
  opts = {
    use_default_keymaps = false,
  },
}

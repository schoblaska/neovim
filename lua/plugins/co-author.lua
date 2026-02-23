return {
  "2kabhishek/co-author.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = { "CoAuthor" },
  keys = {
    { "<leader>gC", "<cmd>CoAuthor<cr>", desc = "Add co-author" },
  },
}

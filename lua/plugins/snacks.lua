return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    { "<leader>e", function() require("util.outline").open() end, desc = "Outline" },
  },
}

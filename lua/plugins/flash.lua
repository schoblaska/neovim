return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
    { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
  },
  opts = {
    modes = {
      search = { enabled = false },
      char = { jump_labels = true },
      treesitter = {
        highlight = { backdrop = true },
        label = { rainbow = { enabled = true } },
      },
    },
  }
}

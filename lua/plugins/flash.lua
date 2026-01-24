return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" }
  },
  opts = {
    modes = {
      search = { enabled = false },
      char = { jump_labels = true }
    }
  }
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      win = {
        -- Telescope scrolls the preview with C-u / C-d; snacks scrolls the list
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<c-u>"] = "preview_scroll_up",
            ["<c-d>"] = "preview_scroll_down",
          },
        },
      },
    },
  },
  keys = {
    { "<leader>e", function() require("util.outline").open() end, desc = "Outline" },
  },
}

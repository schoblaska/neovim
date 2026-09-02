return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      -- Mirror the telescope layout: full screen, prompt on top, preview at
      -- half width, stacking the preview underneath on a narrow screen
      layouts = {
        wide = {
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0,
            height = 0,
            border = "none",
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", title_pos = "center", border = true, width = 0.5 },
          },
        },
        tall = {
          layout = {
            box = "vertical",
            backdrop = false,
            width = 0,
            height = 0,
            border = "none",
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", title_pos = "center", border = true, height = 0.6 },
          },
        },
      },
      layout = {
        preset = function()
          return vim.o.columns >= 160 and "wide" or "tall"
        end,
      },
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

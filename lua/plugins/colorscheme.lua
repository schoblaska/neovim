return {
  -- Nightfox theme (duskfox/dayfox)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic"
          }
        },
        groups = {
          all = {
            -- Tab styling
            TabLineSel = { fg = "fg1", bg = "bg1" },
            TabLineSeparatorSel = { fg = "palette.yellow" },
            TabLineSeparator = { fg = "palette.comment", bg = "bg0" },
            TabLine = { fg = "palette.comment", bg = "bg0" },
            TabLineFill = { bg = "bg0" },

            -- Winbar (breadcrumbs) - match editor background
            WinBar = { bg = "bg1" },
            WinBarNC = { bg = "bg1" },

            -- Flash - dim but don't italicize backdrop
            FlashBackdrop = { fg = "palette.comment" },

            -- String delimiters (quotes) same color as strings
            ["@string.delimiter"] = { link = "String" },
            rubyStringDelimiter = { link = "String" },

            -- Ruby function calls styled like variables
            ["@function.call.ruby"] = { link = "@variable" }
          },
          duskfox = {
            IblIndent = { fg = "bg2" }
          },
          dayfox = {
            IblIndent = { fg = "bg2" },
            CursorLine = { bg = "bg0" }
          }
        }
      })
    end
  },

  -- Auto dark mode - follows system theme
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 999,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.cmd("colorscheme duskfox")
      end,
      set_light_mode = function()
        vim.cmd("colorscheme dayfox")
      end
    }
  }
}

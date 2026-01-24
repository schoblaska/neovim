return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = { left = "•", right = "•" },
      section_separators = { left = "", right = "" },
      globalstatus = true
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "diff" },
      lualine_x = {
        { "diagnostics", sources = { "nvim_lsp" } }
      },
      lualine_y = { "progress" },
      lualine_z = { "filename" }
    }
  }
}

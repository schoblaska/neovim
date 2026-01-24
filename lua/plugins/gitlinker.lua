return {
  "schoblaska/gitlinker.nvim",
  keys = {
    { "<leader>gu", mode = { "n", "v" }, desc = "Copy git URL" },
  },
  opts = {
    opts = {
      add_current_line_on_normal_mode = false,
    },
    mappings = "<leader>gu",
  },
}

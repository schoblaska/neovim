return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
}

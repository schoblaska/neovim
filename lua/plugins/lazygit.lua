return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  },
  init = function()
    vim.g.lazygit_floating_window_scaling_factor = 1
    vim.g.lazygit_floating_window_use_plenary = 0
    vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
  end
}

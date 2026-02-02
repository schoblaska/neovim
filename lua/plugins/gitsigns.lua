return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  keys = {
    { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next hunk" },
    { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Prev hunk" },
    { "<leader>hh", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk" },
    { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<leader>hs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, mode = "v", desc = "Stage selection" },
    { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage" },
  },
  opts = {
    signs = {
      add = { text = "▕" },
      change = { text = "▕" },
      delete = { text = "▕" },
      untracked = { text = "┆" },
    },
    attach_to_untracked = true,
    signcolumn = true,
    numhl = false,
    signs_staged_enable = false,
  },
}

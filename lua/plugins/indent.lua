return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  opts = {
    indent = {
      char = "│",
      highlight = "IblIndent"
    },
    scope = { enabled = false }
  }
}
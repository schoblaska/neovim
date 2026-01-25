return {
  "gbprod/substitute.nvim",
  keys = {
    { "X", function() require("substitute").operator() end, desc = "Substitute" },
    { "X", function() require("substitute").visual() end, mode = "x", desc = "Substitute" },
  },
  opts = {},
}

return {
  "gbprod/substitute.nvim",
  keys = {
    { "X", function() require("substitute").operator() end, desc = "Substitute" },
    { "XX", function() require("substitute").line() end, desc = "Substitute line" },
    { "X", function() require("substitute").visual() end, mode = "x", desc = "Substitute" },
  },
  opts = {},
}

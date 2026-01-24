return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {
    keymaps = {
      visual = "s",
    },
    aliases = {
      ["a"] = ">",
      ["p"] = ")",
      ["c"] = "}",
      ["b"] = "]",
      ["q"] = { '"', "'", "`" },
      ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
  },
}

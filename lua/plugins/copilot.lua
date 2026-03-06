return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    server = { type = "binary" },
    suggestion = {
      enabled = false,
      auto_trigger = false,
    },
    panel = { enabled = false },
  },
}

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false, -- Show alongside blink menu
    },
    panel = { enabled = false },
  },
}

return {
  "folke/sidekick.nvim",
  event = "VeryLazy",
  opts = {
    nes = {
      enabled = true,
      trigger = {
        events = {},
      },
      clear = {
        events = { "TextChangedI", "TextChanged", "BufWritePre", "InsertEnter" },
        esc = true,
      },
    },
    cli = { enabled = false },
  },
  keys = {
    {
      "<tab>",
      function()
        local nes = require("sidekick.nes")
        if nes.have() then
          require("sidekick").nes_jump_or_apply()
        else
          nes.update()
        end
      end,
      mode = { "n" },
      desc = "NES: trigger or jump/apply",
    },
    {
      "<S-tab>",
      function()
        local nes = require("sidekick.nes")
        if nes.have() then
          nes.update()
        end
      end,
      mode = { "n" },
      desc = "NES: cycle to next suggestion",
    },
  },
}

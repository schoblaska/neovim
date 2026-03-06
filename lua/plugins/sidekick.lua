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
        events = { "TextChangedI", "InsertEnter" },
        esc = true,
      },
    },
    cli = { enabled = false },
  },
  keys = {
    {
      "<tab>",
      function()
        if require("sidekick").nes_jump_or_apply() then
          return
        end
        require("sidekick.nes").update()
      end,
      mode = { "n" },
      desc = "NES: trigger or jump/apply",
    },
    {
      "<S-tab>",
      function()
        if require("sidekick.nes").have() then
          require("sidekick.nes").update()
        end
      end,
      mode = { "n" },
      desc = "NES: cycle to next suggestion",
    },
  },
}

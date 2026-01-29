return {
  "folke/sidekick.nvim",
  event = "VeryLazy",
  opts = {
    nes = {
      enabled = true,
      clear = {
        events = { "TextChangedI" }, -- Removed InsertEnter so NES visible when entering insert
        esc = true,
      },
    },
    cli = { enabled = false },
  },
  keys = {
    {
      "<tab>",
      function()
        require("sidekick").nes_jump_or_apply()
      end,
      mode = { "n" },
      desc = "NES jump/apply",
    },
  },
}

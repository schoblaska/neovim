return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "fang2hou/blink-copilot",
  },
  event = "InsertEnter",
  opts = {
    sources = {
      default = { "lsp", "copilot", "path", "buffer" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
          opts = {
            max_completions = 3,
            debounce = 75, -- Faster suggestions (default 200ms)
            kind_icon = "󰚩",
          },
        },
      },
    },
    keymap = {
      ["<Tab>"] = {
        "snippet_forward",
        function()
          if require("sidekick").nes_jump_or_apply() then return true end
        end,
        function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
            return true
          end
        end,
        "select_and_accept",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
    },
    completion = {
      trigger = {
        show_on_insert = true,
        show_on_blocked_trigger_characters = {},
      },
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}

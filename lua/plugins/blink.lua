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
            kind_icon = "󰚩",
          },
        },
      },
    },
    keymap = {
      ["<Tab>"] = {
        -- 1. Accept snippet placeholder
        "snippet_forward",
        -- 2. Jump to NES hunk (sidekick)
        function(cmp)
          if require("sidekick").nes_jump_or_apply() then
            return true
          end
        end,
        -- 3. Accept completion if menu visible
        "select_and_accept",
        -- 4. Fallback to normal tab
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
    },
    completion = {
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

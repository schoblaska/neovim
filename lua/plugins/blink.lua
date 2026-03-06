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
            debounce = 75,
            kind_icon = "󰚩",
          },
        },
      },
    },
    keymap = {
      ["<Tab>"] = {
        "snippet_forward",
        "show",
        "select_and_accept",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["j"] = { "select_next", "fallback" },
      ["k"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
    },
    completion = {
      trigger = {
        prefetch_on_insert = false,
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert = false,
        show_on_backspace = false,
        show_on_backspace_in_keyword = false,
        show_on_backspace_after_accept = false,
        show_on_backspace_after_insert_enter = false,
        show_on_accept_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
        show_on_blocked_trigger_characters = {},
      },
      list = {
        selection = { preselect = true, auto_insert = false },
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
      ghost_text = {
        enabled = true,
      },
    },
  },
}

return {
  "github/copilot.vim",
  event = "InsertEnter",
  cmd = { "Copilot" },
  config = function()
    vim.keymap.set("i", "<Tab>", 'copilot#Accept("<Tab>")', { expr = true, replace_keycodes = false })
  end,
}

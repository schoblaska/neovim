return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
  keys = {
    { "<leader>nn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New note" },
    { "<leader>nt", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Find notes" },
    { "<leader>na", function()
      local input = vim.fn.input("Search: ")
      if input ~= "" then
        require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = { input .. "*" } })
      end
    end, desc = "Search notes" },
    { "<leader>na", ":'<,'>ZkMatch<CR>", mode = "v", desc = "Search notes (selection)" },
    { "<leader>n#", "<Cmd>ZkTags<CR>", desc = "Tags" },
    { "<leader>nj", "<Cmd>ZkNew { group = 'journal' }<CR>", desc = "Journal" },
    { "<leader>nb", "<Cmd>ZkBacklinks<CR>", desc = "Backlinks" },
    { "<leader>nl", "<Cmd>ZkLinks<CR>", desc = "Links" },
  },
}

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
    { "<leader>nf", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Find notes" },
    { "<leader>nt", "<Cmd>ZkTags<CR>", desc = "Tags" },
    { "<leader>nf", ":'<,'>ZkMatch<CR>", mode = "v", desc = "Find matching notes" },
    { "<leader>nj", "<Cmd>ZkNew { dir = 'journal' }<CR>", desc = "Journal" },
    { "<leader>nb", "<Cmd>ZkBacklinks<CR>", desc = "Backlinks" },
    { "<leader>nl", "<Cmd>ZkLinks<CR>", desc = "Links" },
  },
}

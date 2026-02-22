return {
  "zk-org/zk-nvim",
  config = function()
    local notebook = vim.env.ZK_NOTEBOOK_DIR
    if notebook then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = notebook .. "/*.md",
        callback = function(ev)
          if vim.fn.fnamemodify(ev.file, ":t") == "index.md" then return end
          vim.fn.jobstart({ "zk", "gen-index" }, { cwd = notebook })
        end,
      })
    end

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
    { "<leader>nn", function()
      local small_words = { "a", "an", "and", "as", "at", "but", "by", "for", "in", "nor", "of", "on", "or", "so", "the", "to", "up", "yet" }
      local skip = {}
      for _, w in ipairs(small_words) do skip[w] = true end

      local function title_case(str)
        local words = {}
        for word in str:gmatch("%S+") do
          if #words == 0 or not skip[word:lower()] then
            table.insert(words, word:sub(1, 1):upper() .. word:sub(2):lower())
          else
            table.insert(words, word:lower())
          end
        end
        return table.concat(words, " ")
      end

      local input = vim.fn.input("Title: ")
      if input ~= "" then
        require("zk.commands").get("ZkNew")({ title = title_case(input) })
      end
    end, desc = "New note" },
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

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
          vim.fn.jobstart({ "zk-semantic", "index" })
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
    { "<leader>ns", function()
      local query = vim.fn.input("Semantic search: ")
      if query == "" then return end

      local result = vim.fn.system({ "zk-semantic", "search", query })
      if vim.v.shell_error ~= 0 then
        vim.notify("zk-semantic error: " .. result, vim.log.levels.ERROR)
        return
      end

      local ok, items = pcall(vim.json.decode, result)
      if not ok or not items or #items == 0 then
        vim.notify("No results", vim.log.levels.INFO)
        return
      end

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers.new({}, {
        prompt_title = "Semantic: " .. query,
        finder = finders.new_table({
          results = items,
          entry_maker = function(entry)
            local title = entry.title or ""
            local heading = entry.heading:gsub("^#+%s*", "")
            local label = title ~= "" and heading ~= title
              and (title .. " > " .. heading) or heading
            return {
              value = entry,
              display = string.format("%.2f  %s", entry.score, label),
              ordinal = label,
              filename = entry.file,
              lnum = entry.line,
            }
          end,
        }),
        sorter = conf.generic_sorter({}),
        previewer = conf.file_previewer({}),
        attach_mappings = function(buf, map)
          actions.select_default:replace(function()
            actions.close(buf)
            local sel = action_state.get_selected_entry()
            if sel then
              vim.cmd("edit +" .. sel.value.line .. " " .. vim.fn.fnameescape(sel.value.file))
            end
          end)
          return true
        end,
      }):find()
    end, desc = "Semantic search" },
  },
}

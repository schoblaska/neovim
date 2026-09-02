local M = {}

-- Markdown headings as a telescope picker
function M.headings()
  local headings = {}
  for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    if line:match("^#+%s") then
      table.insert(headings, { lnum = i, text = line })
    end
  end
  if #headings == 0 then
    vim.notify("No headings", vim.log.levels.INFO)
    return
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values

  pickers.new({}, {
    prompt_title = "Headings",
    finder = finders.new_table({
      results = headings,
      entry_maker = function(entry)
        local indent = entry.text:match("^(#+)"):len() - 1
        local label = string.rep("  ", indent) .. entry.text:gsub("^#+%s*", "")
        return {
          value = entry,
          display = label,
          ordinal = label,
          lnum = entry.lnum,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(buf)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      actions.select_default:replace(function()
        actions.close(buf)
        local sel = action_state.get_selected_entry()
        if sel then vim.api.nvim_win_set_cursor(0, { sel.lnum, 0 }) end
      end)
      return true
    end,
  }):find()
end

-- Functions, classes, etc. via LSP, falling back to treesitter
function M.symbols()
  local builtin = require("telescope.builtin")
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client:supports_method("textDocument/documentSymbol") then
      return builtin.lsp_document_symbols({ symbol_width = 60 })
    end
  end
  builtin.treesitter()
end

function M.open()
  if vim.bo.filetype == "markdown" then
    M.headings()
  else
    M.symbols()
  end
end

return M

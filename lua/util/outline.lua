local M = {}

-- Markdown has no treesitter `locals` query, so headings need their own finder.
-- Items are shaped for the `lsp_symbol` format, nested by heading level.
local function headings(buf)
  local items = {}
  local stack = { [0] = { text = "", root = true } }
  local fenced = false

  for lnum, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    if line:match("^%s*```") then
      fenced = not fenced
    end

    local hashes, name = line:match("^(#+)%s+(.*)$")

    if hashes and not fenced and #hashes <= 6 then
      name = name:gsub("%[([^%]]*)%]%b()", "%1"):gsub("%s*#+%s*$", "")
      local level = #hashes
      local parent

      -- A heading that skips a level (## then ####) hangs off its nearest ancestor
      for i = level - 1, 0, -1 do
        if stack[i] then
          parent = stack[i]
          break
        end
      end

      local item = {
        kind = "String",
        name = name,
        text = name,
        parent = parent,
        tree = true,
        buf = buf,
        file = vim.api.nvim_buf_get_name(buf),
        pos = { lnum, 0 },
      }

      for i = level, 6 do stack[i] = nil end
      stack[level] = item
      items[#items + 1] = item
    end
  end

  -- The tree draws └─ off `last`, so only the final child of each parent keeps it
  local last = {}
  for _, item in ipairs(items) do
    if last[item.parent] then last[item.parent].last = nil end
    last[item.parent] = item
    item.last = true
  end

  return items
end

-- Functions, classes, headings — LSP where a server is attached, treesitter otherwise
function M.open()
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client:supports_method("textDocument/documentSymbol") then
      return Snacks.picker.lsp_symbols()
    end
  end

  if vim.bo.filetype == "markdown" then
    return Snacks.picker({
      source = "headings",
      title = "Headings",
      items = headings(vim.api.nvim_get_current_buf()),
      format = "lsp_symbol",
      tree = true,
    })
  end

  Snacks.picker.treesitter()
end

return M

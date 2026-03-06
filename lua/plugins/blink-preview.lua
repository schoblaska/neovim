-- Completion preview split for blink.cmp
-- Bottom split showing syntax-highlighted preview of the selected
-- completion applied, with DiffChange background on modified lines.

local state = { win = nil, buf = nil }

local function clear()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
  end
  state.win = nil
end

local function show_preview()
  local ok, cmp = pcall(require, "blink.cmp")
  if not ok then return clear() end

  local item = cmp.get_selected_item()
  if not item then return clear() end

  local te_ok, text_edits = pcall(require, "blink.cmp.lib.text_edits")
  if not te_ok then return clear() end

  local text_edit = text_edits.get_from_item(item)
  if not text_edit then return clear() end

  -- Resolve snippet placeholders to plain text
  if item.insertTextFormat == vim.lsp.protocol.InsertTextFormat.Snippet then
    local snip_ok, snippets = pcall(require, "blink.cmp.sources.snippets.utils")
    if snip_ok then
      local parsed = snippets.safe_parse(text_edit.newText)
      text_edit.newText = parsed and tostring(parsed) or text_edit.newText
    end
  end

  local edit_start = text_edit.range.start.line -- 0-indexed
  local edit_end = text_edit.range["end"].line
  local context = 1
  local buf_line_count = vim.api.nvim_buf_line_count(0)
  local preview_start = math.max(0, edit_start - context)
  local preview_end = math.min(buf_line_count - 1, edit_end + context)
  local lines = vim.api.nvim_buf_get_lines(0, preview_start, preview_end + 1, false)

  -- Apply the text edit to the copied lines (adjust to relative offsets)
  local rel_start = edit_start - preview_start
  local rel_end = edit_end - preview_start
  local start_col = text_edit.range.start.character
  local end_col = text_edit.range["end"].character
  local new_lines = vim.split(text_edit.newText, "\n", { plain = true })

  local prefix = lines[rel_start + 1]:sub(1, start_col)
  local suffix = lines[rel_end + 1]:sub(end_col + 1)
  new_lines[1] = prefix .. new_lines[1]
  new_lines[#new_lines] = new_lines[#new_lines] .. suffix

  local result = {}
  for i = 1, rel_start do table.insert(result, lines[i]) end
  for _, l in ipairs(new_lines) do table.insert(result, l) end
  for i = rel_end + 2, #lines do table.insert(result, lines[i]) end

  -- Left pad and bottom padding
  for i, line in ipairs(result) do
    result[i] = "   " .. line
  end
  table.insert(result, "")

  -- Create/reuse scratch buffer
  if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = vim.api.nvim_create_buf(false, true)
  end
  vim.api.nvim_buf_set_lines(state.buf, 0, -1, false, result)
  vim.bo[state.buf].filetype = vim.bo.filetype

  -- Float pinned to bottom of editor (looks like a split, no layout shift)
  local height = math.min(#result, math.floor(vim.o.lines * 0.5))
  local win_opts = {
    relative = "editor",
    row = vim.o.lines - height - 2,
    col = 0,
    width = vim.o.columns,
    height = height,
    style = "minimal",
    border = "none",
    zindex = 1,
  }

  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_set_config(state.win, win_opts)
    vim.api.nvim_win_set_buf(state.win, state.buf)
  else
    state.win = vim.api.nvim_open_win(state.buf, false, win_opts)
    vim.wo[state.win].winhighlight = "Normal:NormalFloat"
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpListSelect",
  callback = show_preview,
})

vim.api.nvim_create_autocmd("User", {
  pattern = { "BlinkCmpHide", "BlinkCmpMenuClose" },
  callback = clear,
})

return {}

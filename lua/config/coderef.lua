-- Follow `path/to/file.rb:42` refs from prose into a code split. Works on
-- walkthroughs, grep output, PR notes -- anything that names a file and a
-- line. Paths resolve through the buffer's 'path', so a document written
-- outside the repo still finds its files when 'path' points at the repo root.

local M = {}

local PATTERN = "([%w%-%._/]+):(%d+)"

-- Every ref on the current line that resolves to a real file.
local function refs_on_line()
  local line = vim.api.nvim_get_current_line()
  local refs, init = {}, 1
  while true do
    local first, last, path, lnum = line:find(PATTERN, init)
    if not first then
      return refs
    end
    local found = vim.fn.findfile(path, vim.bo.path)
    if found ~= "" then
      table.insert(refs, { first = first, last = last, path = found, lnum = tonumber(lnum) })
    end
    init = last + 1
  end
end

-- The ref under the cursor, else the first one on the line.
local function ref_at_cursor()
  local refs = refs_on_line()
  if #refs == 0 then
    return nil
  end
  local col = vim.fn.col(".")
  for _, ref in ipairs(refs) do
    if col >= ref.first and col <= ref.last then
      return ref
    end
  end
  return refs[1]
end

-- Any other ordinary window in this tab. Reusing it keeps a walkthrough two
-- panes wide instead of stacking a split per ref.
local function code_win()
  local current = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if win ~= current and vim.api.nvim_win_get_config(win).relative == "" then
      return win
    end
  end
end

-- Open the ref beside the prose. Returns false when the line has none, so the
-- caller can fall back to whatever the key normally does.
function M.follow(opts)
  opts = opts or {}
  local ref = ref_at_cursor()
  if not ref then
    return false
  end

  local origin = vim.api.nvim_get_current_win()
  local target = code_win()
  if target then
    vim.api.nvim_set_current_win(target)
  else
    vim.cmd("vsplit")
  end

  vim.cmd("edit " .. vim.fn.fnameescape(ref.path))
  vim.api.nvim_win_set_cursor(0, { math.min(ref.lnum, vim.api.nvim_buf_line_count(0)), 0 })
  vim.cmd("normal! zz")

  if opts.stay then
    vim.api.nvim_set_current_win(origin)
  end
  return true
end

return M

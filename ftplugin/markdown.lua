-- Auto-continue lists on Enter/o/O (built-in vim feature)
vim.opt_local.comments = "b:*,b:-,b:+,n:>"
vim.opt_local.formatoptions:append("ro")

-- Auto-close fenced code blocks: typing ``` + lang + Enter creates closing ```
vim.keymap.set("i", "<CR>", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^```%w") then
    return "<CR><CR>```<Up>"
  end
  return "<CR>"
end, { buffer = true, expr = true })

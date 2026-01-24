return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      ruby = { "lsp" }
    },
    format_on_save = function(bufnr)
      return {
        timeout_ms = 2000,
        lsp_fallback = true,
        async = false
      }
    end,
    format_after_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == "ruby" then
        return { lsp_fallback = true, async = true }
      end
      return false
    end
  }
}

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {}
    })

    -- Ruby LSP (nvim 0.11+ native config)
    -- Use mise shim directly to respect per-project ruby versions
    vim.lsp.config.ruby_lsp = {
      cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
      filetypes = { "ruby", "eruby" },
      root_markers = { "Gemfile", ".git" },
      on_attach = function(client)
        -- Disable semantic tokens (use treesitter highlighting instead)
        client.server_capabilities.semanticTokensProvider = nil
      end
    }
    vim.lsp.enable("ruby_lsp")

    -- Diagnostic signs
    local signs = { Error = "󰚌 ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end

    -- Rounded borders for hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      focusable = false
    })
  end
}

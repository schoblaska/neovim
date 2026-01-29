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
    vim.lsp.config.ruby_lsp = {
      cmd = { "ruby-lsp" },
      filetypes = { "ruby", "eruby" },
      root_markers = { "Gemfile", ".git" },
      init_options = {
        formatter = "rubocop",
        linters = { "rubocop" },
        -- https://github.com/Shopify/ruby-lsp-rails/pull/570
        addonSettings = {
          ["Ruby LSP Rails"] = {
            enablePendingMigrationsPrompt = false,
          },
        },
      },
      on_attach = function(client)
        -- Disable semantic tokens (use treesitter highlighting instead)
        client.server_capabilities.semanticTokensProvider = nil
      end
    }
    vim.lsp.enable("ruby_lsp")

    -- Diagnostic signs (nvim 0.11+ API)
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰚌 ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    -- Rounded borders for hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      focusable = false
    })
  end
}

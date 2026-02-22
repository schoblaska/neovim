return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.esupports.metagen"] = {
          config = {
            author = "joseph",
            type = "auto",
            update_date = true,
          },
        },
        ["core.journal"] = {
          config = {
            strategy = "flat",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              neorg = "~/projects/neorg",
            },
            default_workspace = "neorg",
          },
        },
      },
    })
  end,
}

return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              neorg = "~/projects/neorg",
            },
            default_workspace = "neorg",
          },
        },
        ["core.journal"] = {},
      },
    })
  end,
}

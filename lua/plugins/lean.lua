return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },
  init = function()
    vim.g.lean_config = { mappings = true }
  end,
  config = function()
    -- <LocalLeader>r would shadow Telescope resume in Lean buffers
    for _, mapping in ipairs(require("lean").mappings) do
      if mapping[1] == "<LocalLeader>r" then mapping[1] = "<LocalLeader>lr" end
    end
  end,
}

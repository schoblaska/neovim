return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    { "junegunn/fzf", build = ":call fzf#install()" },
  },
  opts = {
    func_map = {
      drop = "<cr>",
      open = "o",
      pscrollup = "<C-u>",
      pscrolldown = "<C-d>",
    },
    preview = {
      winblend = 0,
      win_height = 30,
    },
    filter = {
      fzf = {
        extra_opts = { "--color", "fg:-1,bg:-1,hl:4,fg+:-1,bg+:-1,hl+:4,info:2,prompt:6,pointer:1,marker:5,spinner:3,header:8" },
      },
    },
  },
}

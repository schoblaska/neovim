return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>a", "<cmd>Telescope live_grep_args<cr>", desc = "Live grep" },
    { "<leader>j", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    {
      "<leader>a",
      function()
        vim.cmd('normal! "zy')
        require("telescope").extensions.live_grep_args.live_grep_args({ default_text = vim.fn.getreg("z") })
      end,
      mode = "v",
      desc = "Grep selection"
    },
    { "<leader>fo", "<cmd>Telescope file_browser files=false<cr>", desc = "Browse folders" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        previewer = true,
        preview = {
          treesitter = true
        },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        dynamic_preview_title = true,
        results_title = false,
        path_display = { "filename_first" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
            preview_cutoff = 90
          },
          vertical = {
            prompt_position = "top",
            preview_height = 0.60
          },
          flex = {
            flip_columns = 160
          },
          width = 999,
          height = 999
        },
        file_ignore_patterns = { "^.git/" }
      },
      pickers = {
        find_files = {
          hidden = true
        },
        buffers = {
          sort_mru = true
        },
        lsp_references = {
          include_declaration = false,
          show_line = false
        },
        lsp_definitions = {
          jump_type = "never",
          include_declaration = false,
          show_line = false
        }
      },
      extensions = {
        live_grep_args = {
          auto_quoting = false,
          mappings = {
            i = {
              ["<C-o>"] = require("telescope-live-grep-args.actions").quote_prompt()
            }
          }
        },
        file_browser = {
          depth = false,
          path_display = {},
          mappings = {
            ["i"] = {
              ["<cr>"] = function(prompt_bufnr)
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")
                local entry = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                require("oil").open(entry.path)
              end,
            },
          },
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("file_browser")
  end
}

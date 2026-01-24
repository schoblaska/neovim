return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  keys = {
    { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>a", "<cmd>Telescope live_grep_args<cr>", desc = "Live grep" },
    {
      "<leader>j",
      function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local make_entry = require("telescope.make_entry")

        local cwd = vim.fn.getcwd()
        local jumplist = vim.fn.getjumplist()[1]
        local filtered = {}

        -- Filter jumplist to current project
        for _, jump in ipairs(jumplist) do
          if jump.bufnr > 0 then
            local bufname = vim.api.nvim_buf_get_name(jump.bufnr)
            if bufname ~= "" then
              local abs_path = vim.fn.fnamemodify(bufname, ":p")
              -- Only include if it's in cwd or doesn't start with /Users (relative path)
              if vim.startswith(abs_path, cwd .. "/") or not vim.startswith(bufname, "/Users") then
                local text = ""
                if vim.api.nvim_buf_is_loaded(jump.bufnr) and jump.lnum > 0 then
                  local lines = vim.api.nvim_buf_get_lines(jump.bufnr, jump.lnum - 1, jump.lnum, false)
                  text = lines[1] or ""
                end

                table.insert(filtered, {
                  bufnr = jump.bufnr,
                  filename = bufname,
                  lnum = jump.lnum,
                  col = jump.col,
                  text = text
                })
              end
            end
          end
        end

        pickers.new({}, {
          prompt_title = "Jumplist (Project)",
          finder = finders.new_table({
            results = filtered,
            entry_maker = make_entry.gen_from_quickfix()
          }),
          sorter = conf.generic_sorter({}),
          previewer = conf.qflist_previewer({})
        }):find()
      end,
      desc = "Jumplist (project only)"
    },
    { "<leader>f", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser (current file)" },
    {
      "<leader>a",
      function()
        vim.cmd('normal! "zy')
        require("telescope").extensions.live_grep_args.live_grep_args({ default_text = vim.fn.getreg("z") })
      end,
      mode = "v",
      desc = "Grep selection"
    }
  },
  config = function()
    local telescope = require("telescope")
    local fb_actions = require("telescope._extensions.file_browser.actions")

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
          path_display = function(opts, path)
            local action_state = require("telescope.actions.state")
            local current_line = action_state.get_current_line()

            if current_line == "" and opts.finder.files and path:match("%w+/[%w_]+") then
              return path:gsub("^.+/", "  ")
            else
              return path
            end
          end,
          git_status = false,
          hidden = true,
          initial_mode = "insert",
          file_ignore_patterns = { ".git/" },
          depth = 2,
          display_stat = false,
          mappings = {
            ["i"] = {
              ["<Left>"] = fb_actions.goto_parent_dir
            },
            ["n"] = {
              ["a"] = fb_actions.create,
              ["<Left>"] = fb_actions.goto_parent_dir
            }
          }
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("file_browser")
  end
}

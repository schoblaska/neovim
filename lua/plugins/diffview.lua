return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gs", "<cmd>DiffviewOpen<cr>", desc = "Git status" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
    { "<leader>gp", "<cmd>DiffviewOpen origin/main...HEAD --imply-local<cr>", desc = "PR review" },
    {
      "<leader>gS",
      function()
        local pattern = vim.fn.input("Search commits for: ")
        if pattern ~= "" then
          vim.cmd("DiffviewFileHistory -G" .. vim.fn.shellescape(pattern))
        end
      end,
      desc = "Search commits (git log -G)",
    },
    {
      "<leader>gc",
      function()
        local commit = vim.fn.trim(vim.fn.input("Show commit: "))
        if commit ~= "" then
          vim.cmd("DiffviewOpen " .. commit .. "^!")
          vim.schedule(function()
            vim.cmd("DiffviewFocusFiles")
          end)
        end
      end,
      desc = "Show commit",
    },
  },
  config = function()
    local actions = require("diffview.actions")
    local lib = require("diffview.lib")

    local function goto_file_and_close()
      actions.goto_file_edit()
      vim.cmd("DiffviewClose")
    end

    local function discard_changes()
      vim.ui.select({ "Yes", "No" }, { prompt = "Discard changes?" }, function(choice)
        if choice == "Yes" then
          actions.restore_entry()
        end
      end)
    end

    require("diffview").setup({
      enhanced_diff_hl = true,
      hooks = {
        view_opened = function(view)
          vim.cmd("tabmove 0")
          -- Close diffview when leaving its tab
          vim.api.nvim_create_autocmd("TabLeave", {
            callback = function()
              if lib.get_current_view() then
                vim.schedule(function()
                  view:close()
                end)
              end
            end,
            once = true,
          })
        end,
      },
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
          { "n", "-", actions.toggle_files, { desc = "Toggle file panel" } },
          { "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
          { "n", "<s-tab>", actions.select_prev_entry, { desc = "Prev file" } },
          { "n", "<cr>", goto_file_and_close, { desc = "Open file" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
          { "n", "-", actions.toggle_files, { desc = "Toggle file panel" } },
          { "n", "<tab>", actions.select_next_entry, { desc = "Next file" } },
          { "n", "<s-tab>", actions.select_prev_entry, { desc = "Prev file" } },
          { "n", "<cr>", goto_file_and_close, { desc = "Open file" } },
          { "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
          { "n", "d", discard_changes, { desc = "Discard changes" } },
          { "n", "j", actions.next_entry, { desc = "Next entry" } },
          { "n", "k", actions.prev_entry, { desc = "Prev entry" } },
          { "n", "o", actions.select_entry, { desc = "Preview" } },
          { "n", "<c-u>", actions.scroll_view(-0.25), { desc = "Scroll up" } },
          { "n", "<c-d>", actions.scroll_view(0.25), { desc = "Scroll down" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
          { "n", "-", actions.toggle_files, { desc = "Toggle file panel" } },
          { "n", "<tab>", actions.select_next_entry, { desc = "Next commit" } },
          { "n", "<s-tab>", actions.select_prev_entry, { desc = "Prev commit" } },
          { "n", "j", actions.next_entry, { desc = "Next commit" } },
          { "n", "k", actions.prev_entry, { desc = "Prev commit" } },
          { "n", "o", actions.select_entry, { desc = "Preview diff" } },
          { "n", "L", actions.open_commit_log, { desc = "Commit details" } },
          { "n", "y", actions.copy_hash, { desc = "Copy commit hash" } },
          { "n", "<c-u>", actions.scroll_view(-0.25), { desc = "Scroll up" } },
          { "n", "<c-d>", actions.scroll_view(0.25), { desc = "Scroll down" } },
        },
      },
    })

    vim.opt.fillchars:append({ diff = "╱" })
  end,
}

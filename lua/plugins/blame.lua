return {
  "FabijanZulj/blame.nvim",
  keys = {
    { "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Git blame" },
  },
  config = function()
    -- Get colors from nightfox palette
    local ok, palette = pcall(function()
      return require("nightfox.palette").load(vim.g.colors_name or "duskfox")
    end)

    local colors = nil
    if ok and palette then
      colors = {
        palette.red.base,
        palette.orange.base,
        palette.yellow.base,
        palette.green.base,
        palette.cyan.base,
        palette.blue.base,
        palette.magenta.base,
        palette.pink.base,
      }
    end

    local function format_blame(line_porcelain, config, idx)
      local hash = string.sub(line_porcelain.hash, 1, 7)
      if hash == "0000000" then
        return {
          idx = idx,
          values = { { textValue = "uncommitted", hl = "Comment" } },
          format = "%s",
        }
      end

      -- Get initials from author name
      local initials = line_porcelain.author:gsub("(%w)%w*%s*", "%1"):upper()

      -- Relative time (readable)
      local seconds = os.time() - line_porcelain.committer_time
      local time_str
      if seconds < 3600 then
        local m = math.floor(seconds / 60)
        time_str = m .. " min ago"
      elseif seconds < 86400 then
        local h = math.floor(seconds / 3600)
        time_str = h .. " hour" .. (h == 1 and "" or "s") .. " ago"
      elseif seconds < 604800 then
        local d = math.floor(seconds / 86400)
        time_str = d .. " day" .. (d == 1 and "" or "s") .. " ago"
      elseif seconds < 2592000 then
        local w = math.floor(seconds / 604800)
        time_str = w .. " week" .. (w == 1 and "" or "s") .. " ago"
      else
        time_str = os.date("%b %d", line_porcelain.committer_time)
      end

      return {
        idx = idx,
        values = {
          { textValue = hash, hl = hash },
          { textValue = initials, hl = "Comment" },
          { textValue = time_str, hl = "Comment" },
        },
        format = "%s  %s  %s",
      }
    end

    require("blame").setup({
      merge_consecutive = false,
      focus_blame = true,
      colors = colors,
      format_fn = format_blame,
      commit_detail_view = function(commit_hash)
        local hash = vim.fn.trim(commit_hash)
        -- Move to the source window (right of blame) before opening diffview
        vim.cmd("wincmd l")
        vim.cmd("DiffviewOpen " .. hash .. "^!")
        vim.schedule(function()
          vim.cmd("DiffviewFocusFiles")
        end)
      end,
    })
  end,
}

return {
  "delphinus/md-render.nvim",
  version = "*",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", version = "*" }, -- file type icons in code blocks
    { "delphinus/budoux.lua", version = "*" }, -- CJK phrase-level line breaking
  },
  keys = (function()
    -- The plugin caps render width at 80 unless an explicit max_width is passed.
    -- Compute the current window's usable text width (window width minus the
    -- gutter: signcolumn/number/foldcolumn) so the render fills the pane.
    -- Note: passing an explicit width disables the plugin's WinResized handler,
    -- so this fits the pane at render time but won't re-flow on later resizes.
    local function pane_width()
      local win = vim.api.nvim_get_current_win()
      local total = vim.api.nvim_win_get_width(win)
      local textoff = (vim.fn.getwininfo(win)[1] or {}).textoff or 0
      return math.max(1, total - textoff)
    end

    return {
      {
        "<leader>md",
        function()
          require("md-render").preview.toggle({ max_width = pane_width() })
        end,
        desc = "Markdown render toggle (same window)",
      },
      {
        "<leader>mt",
        function()
          require("md-render").preview.show({ max_width = pane_width() })
        end,
        desc = "Markdown preview (float)",
      },
      {
        "<leader>mp",
        function()
          require("md-render").preview.show({ max_width = pane_width() })
        end,
        desc = "Markdown preview (float)",
      },
      {
        "<leader>ms",
        function()
          -- Vertical split takes ~half the current window; size to that.
          require("md-render").preview.split({
            max_width = math.max(1, math.floor(pane_width() / 2)),
            mods = { vertical = true, split = "belowright" },
          })
        end,
        desc = "Markdown render in a vertical split",
      },
    }
  end)(),
}

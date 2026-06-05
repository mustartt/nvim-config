return {
  "delphinus/md-render.nvim",
  version = "*",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", version = "*" }, -- file type icons in code blocks
    { "delphinus/budoux.lua", version = "*" }, -- CJK phrase-level line breaking
  },
  keys = {
    { "<leader>md", "<Plug>(md-render-toggle)"},
    { "<leader>mt", "<Plug>(md-render-preview)"},
    { "<leader>mp", "<Plug>(md-render-preview)"},
    {
      "<leader>ms",
      function()
        require("md-render").preview.split({ mods = { vertical = true, split = "belowright" } })
      end,
      desc = "Markdown render in a vertical split",
    },
  },
}

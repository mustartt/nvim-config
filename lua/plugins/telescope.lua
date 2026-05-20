return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = { width = 0.9, height = 0.9, preview_height = 0.6 },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
    })

    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>ps", function()
      builtin.live_grep({
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.95,
          height = 0.9,
          preview_width = 0.6,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      })
    end, { desc = "Live grep (rg) in floating window" })
  end,
}

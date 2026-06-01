return {
  { "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", function() vim.cmd("vertical Git") end)
    end,
  },
  {
    "junegunn/gv.vim",
    dependencies = { "tpope/vim-fugitive" },
    config = function()
      vim.keymap.set("n", "<leader>gg", vim.cmd.GV)
    end,
  },
}

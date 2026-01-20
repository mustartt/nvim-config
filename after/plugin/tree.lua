vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local api = require "nvim-tree.api"

local function my_on_attach(bufnr)
  local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc, 
        buffer = bufnr, 
        noremap = true, 
        silent = true, 
        nowait = true 
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '=', api.tree.change_root_to_node, opts('Open Dir'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

vim.keymap.set('n', '<leader>t', api.tree.toggle, {})

require("nvim-tree").setup({
  on_attach = my_on_attach
})

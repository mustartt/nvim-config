require("henry")

vim.o.number = true
vim.o.relativenumber = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.cc = "80"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.scrolloff = 8

if os.getenv("SSH_TTY") ~= nil then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

vim.filetype.add({
  extension = {
    ll = 'llvm'
  }
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

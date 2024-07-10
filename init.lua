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

vim.filetype.add({
    extension = {
        ll = 'llvm'
    }
})

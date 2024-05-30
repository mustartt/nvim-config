local lsp = require("lsp-zero")

lsp.preset('recommended')

require'lspconfig'.clangd.setup{}

lsp.setup()

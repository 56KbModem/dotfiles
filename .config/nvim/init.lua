require('config') -- Load basic config in lua/config.lua

require('plugins/telescope') -- Load telescope fuzzy finder
require('lsp/init') -- Load all my LSP server configs

vim.lsp.enable("rust_analyzer")  -- Enable the rust-analyzer LSP
vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
vim.lsp.enable("bashls")
vim.lsp.enable("gopls")

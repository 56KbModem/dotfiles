require('config') -- Load basic config in lua/config.lua

require('plugins/blink') -- Load Blink Autocompletion 
require('plugins/telescope') -- Load telescope fuzzy finder
require('plugins/treesitter') -- Load treesitter for language understanding

require('lsp/init') -- Load all my LSP server configs

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")
vim.lsp.enable("yamlls")
vim.lsp.enable("bashls")
vim.lsp.enable("gopls")

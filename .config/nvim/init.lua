require('config') -- Load basic config in lua/config.lua
require("lsp.rust")  -- Load the rust.lua configuration
vim.lsp.enable("rust_analyzer")  -- Enable the rust-analyzer LSP


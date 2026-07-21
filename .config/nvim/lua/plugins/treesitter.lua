vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").setup()

local ensure_installed = {
  "lua", "vim", "vimdoc", "query",
  "bash", "python", "go", "rust", "yaml",
  "markdown", "markdown_inline",
}

local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(lang) return not vim.tbl_contains(installed, lang) end)
  :totable()

if #to_install > 0 then
  require("nvim-treesitter").install(to_install)
end

-- The new main branch no longer has a `highlight.enable` option —
-- you start treesitter highlighting per-buffer yourself.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match) or args.match
    pcall(vim.treesitter.start, args.buf, lang)
  end,
})

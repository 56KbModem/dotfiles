-- Tab and indentation settings
vim.opt.tabstop = 4        -- Number of visual spaces per tab
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.softtabstop = 4    -- Number of spaces a tab feels like in insert mode
vim.opt.expandtab = true   -- Use spaces instead of tabs

-- Line numbers
vim.opt.number = true          -- Show absolute line number
vim.opt.relativenumber = true -- Show relative line numbers

-- Syntax highlighting (enabled by default in most distros)
vim.cmd('syntax on')

-- Clipboard integration with wl-copy and wl-paste (Wayland)
vim.opt.clipboard = 'unnamedplus'

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = 0,
}

-- Keep my cursor fattttt
vim.opt.guicursor = ""

-- Clear search highlight when pressing Esc
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR><Esc>', { noremap = true, silent = true })


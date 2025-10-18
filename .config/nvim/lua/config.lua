-- Set leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Set colorscheme
vim.cmd.colorscheme('default')

 -- Set colors for relative linenumbers
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='orange' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='orange' })

-- Do not make words bold (ChatGPT...)
for _, group in ipairs(vim.fn.getcompletion('', 'highlight')) do
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok then
    hl.bold = false
    vim.api.nvim_set_hl(0, group, hl)
  end
end


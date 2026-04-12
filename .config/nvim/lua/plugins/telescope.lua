-- Basic dependencies + Telescope
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",           -- required dependency
  "https://github.com/nvim-telescope/telescope.nvim",   -- main telescope
  -- Optional but highly recommended: fzf-native for much faster sorting
})

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
      },
    },
  },
  pickers = {
    find_files = { theme = "ivy" },
    live_grep = { theme = "ivy" },
  },
})

-- Keymaps
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',  { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>',    { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',  { desc = 'Help tags' })

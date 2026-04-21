-- Basic dependencies + Telescope
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",           -- required dependency
  "https://github.com/nvim-telescope/telescope.nvim",   -- main telescope
  -- Optional but highly recommended: fzf-native for much faster sorting
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Call the fzf extension (needs to be compiled manually!)
pcall(require('telescope').load_extension, 'fzf')

-- Keymaps
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',  { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>',    { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',  { desc = 'Help tags' })

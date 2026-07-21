vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
  enabled = function()
    if vim.b.completion_enabled == false then
      return false
    end
    local disabled_filetypes = { "text", "markdown", "gitcommit" }
    return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
  end,
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    documentation = { auto_show = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = { enabled = true },
})

-- Toggle completion on/off for the current buffer
vim.keymap.set("n", "<leader>tc", function()
  local ok, blink = pcall(require, "blink.cmp")
  if ok and blink.is_visible and blink.is_visible() then
    blink.hide()
  end
  vim.b.completion_enabled = not vim.b.completion_enabled
end, { desc = "Toggle completion" })

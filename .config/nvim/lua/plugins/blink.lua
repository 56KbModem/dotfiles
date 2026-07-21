vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
  keymap = { preset = "default" }, -- try "super-tab" if you want Tab to select/confirm
  appearance = { nerd_font_variant = "mono" },
  completion = {
    documentation = { auto_show = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = { enabled = true },
})

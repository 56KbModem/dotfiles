vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod", ".git", "go.work" },

  settings = {
    gopls = {
      staticcheck = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
    },
  },
}

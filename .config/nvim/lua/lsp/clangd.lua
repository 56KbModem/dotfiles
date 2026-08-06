-- lua/lsp/clangd.lua
vim.lsp.config.clangd = {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true, -- helps clangd's include-insertion behave with your completion engine
      },
    },
    offsetEncoding = { "utf-8" }, -- avoids the classic clangd multi-client offset warning
  },
}

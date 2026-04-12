-- lua/lsp/init.lua
local servers = { "go", "bash", "python", "rust", "yaml" }

for _, server in ipairs(servers) do
  require('lsp.' .. server)
end

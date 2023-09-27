local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local home_path = os.getenv("HOME")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "svelte" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.kotlin_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    storagePath = home_path .. "/.cache/kotlin_language_server"
  }
}

-- 
-- lspconfig.pyright.setup { blabla}

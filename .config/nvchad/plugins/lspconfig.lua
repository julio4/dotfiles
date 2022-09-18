local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "jdtls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.solc.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "solc", "--lsp", "--include-path", "nodes-modules"}
}

local capabilities_encoding = vim.lsp.protocol.make_client_capabilities()
capabilities_encoding.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities_encoding,
}

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",     -- For HTML
  "cssls",    -- For CSS
  "ts_ls", -- For JavaScript and TypeScript
  "jdtls",    -- For Java
  "kotlin_language_server", -- For Kotlin
  "gopls",    -- For Go
  "pyright",  -- For Python
  "rust_analyzer", -- For Rust
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

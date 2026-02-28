local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 定義你需要啟動的伺服器清單
local servers = { 'nixd', 'lua_ls', 'pyright', 'clangd', 'jsonls', 'html', 'cssls', 'jdtls', 'bashls', 'ts_ls', 'marksman', 'yamlls' }

local lsp_servers = {
  nixd = {
    server_name = "nixd",
    server_cmd = { "nixd" },
    filetypes = { "nix" },
  }, 
  lua_ls = {
    server_name = "lua-language-server",
    server_cmd = { "lua-language-server" },
    filetypes = { "lua" },
  }, 
  pyright = {
    server_name = "pyright",
    server_cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
  }, 
  clangd = {
    server_name = "clangd",
    server_cmd = { "clangd" },
    filetypes = { "c", "cpp" },
  }, 
  html = {
    server_name = "vscode-html-language-server",
    server_cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "json", "css" },
  }, 
  jdtls = {
    server_name = "jdtls",
    server_cmd = { "jdtls" },
    filetypes = { "java" },
  }, 
  bashls = {
    server_name = "bashls",
    server_cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
  },
  ts_ls = {
    server_name = "ts_ls",
    server_cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "javascript" },
  },
  marksman = {
    server_name = "marksman",
    server_cmd = { "marksman" },
    filetypes = { "markdown" },
  },
  yamlls = {
    server_name = "yamlls",
    server_cmd = { "yamlls" },
    filetypes = { "yml", "yaml" },
  },
}


for _, lsp in pairs(lsp_servers) do
  vim.lsp.config(
    lsp.server_name, 
    {
      cmd = lsp.server_cmd,
      filetypes = lsp.filetypes,
      capabilities = capabilities,
    }
  )

  vim.lsp.enable(lsp.server_name)
end

















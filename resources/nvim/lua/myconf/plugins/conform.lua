require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    nix = { "nixfmt" },
    cpp = { "clang-format" },
    javascript = { "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    sh = { "shfmt" },
    markdown = { "prettier" },
  },
  -- [[ 保存時自動格式化 ]]
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true, -- 如果找不到格式化工具，回退到使用 LSP 格式化
  },
})


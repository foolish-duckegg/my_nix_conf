require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]], -- 快捷键：Ctrl + \ 打开/关闭
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",      -- 样式：'vertical' | 'horizontal' | 'window' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",      -- 边框样式：'single' | 'double' | 'shadow' | 'curved'
    winblend = 3,           -- 浮窗透明度
  },
})

-- 终端模式下的快捷键优化 (解决退出 Insert 模式难的问题)
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- 在终端按 jk 退出输入模式
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  -- 在终端中方便地切换窗口
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- 仅在 toggleterm 打开时应用这些映射
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


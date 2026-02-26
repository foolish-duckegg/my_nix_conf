local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup { 
    keys = 'etovxqpdygfblzhckisuran', -- 设置提示键（根据个人习惯调整）
    termguicolors = true            -- 确保颜色正常显示
}

-- 快捷键映射 (推荐配置)
local opts = { noremap = true, silent = true }

-- 1. 任意字符搜索跳转 (最常用：类似 f/t 但跨行)
vim.keymap.set('n', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, opts)

vim.keymap.set('n', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, opts)

-- 2. 单词跳转 (类似按 w)
vim.keymap.set('n', '<leader>w', '<cmd>HopWord<CR>', opts)

-- 3. 行跳转 (快速选行)
vim.keymap.set('n', '<leader>l', '<cmd>HopLine<CR>', opts)

-- 4. 模式搜索跳转 (输入 pattern 后跳转)
-- vim.keymap.set('n', '<leader>/', '<cmd>HopPattern<CR>', opts)


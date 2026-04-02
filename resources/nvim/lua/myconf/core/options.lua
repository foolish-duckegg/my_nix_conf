local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.relativenumber = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 光标行
opt.cursorline = true

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索不区分大小写
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = yes

-- 1. 全局默认设置：关闭自动换行
opt.wrap = false

-- 2. 针对特定文件类型开启自动换行
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown", -- 匹配 markdown 文件
-- 	callback = function()
-- 		-- wo 代表 window-local (窗口局部设置)
-- 		-- 确保只在当前 Markdown 窗口开启换行，不影响其他分屏
-- 		vim.wo.wrap = true
--
-- 		-- 可选：开启 linebreak 确保换行不会从单词中间截断
-- 		vim.wo.linebreak = true
--
-- 		-- 开启后，换行后的文本会与上一行的缩进保持对齐，而不是紧贴左边缘。
-- 		vim.wo.breakindent = true
-- 	end,
-- })

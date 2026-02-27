local wk = require("which-key")

-- ui
wk.setup({
    preset = "modern",  
    win = {
        -- border = "rounded",          -- 使用圆角边框 (LazyVim 标志性外观)
        -- position = "bottom",         -- 放在底部
    },
})

wk.add({ 
    { "<leader>yazi", "<cmd>Yazi<cr>", desc = "打开 Yazi 文件管理器" },
    { "<leader>sv", "<C-w>v", desc = "水平新增窗口" },
    { "<leader>sh", "<C-w>s", desc = "垂直新增窗口" },
    { "<leader>nh", ":nohl<CR>", desc = "取消搜索的高亮" },
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "打开/关闭 nvim-tree" },
    { "<S-L>", ":bnext<CR>", desc = "移到右边 buffer 标签" },
    { "<S-H>", ":bprevious<CR>", desc = "移动到左边 buffer 标签" },
    { "<leader>bd", ":Bdelete<CR>", desc = "关闭 buffer" },
    { "f", desc = "字符搜索跳转(光标前)" },
    { "F", desc = "字符搜索跳转(光标后)" },
    { "<leader>w", desc = "单词搜索跳转" },
    { "<leader>?c", function() wk.show({ keys = "<C-", loop = false }) end, desc = "显示所有 Ctrl 快捷键" },
    { "<leader>?s", function() wk.show({ keys = "<S-", loop = false }) end, desc = "显示所有 Shift 快捷键" }, 
    { "<leader>?.", function() wk.show({ keys = "", loop = false }) end, desc = "显示所有 单字母 的快捷键" }, 
    { "<leader>tf", "<Cmd>1ToggleTerm direction=float<CR>", desc = "打开一个悬浮终端" },
    { "<leader>th", "<Cmd>1ToggleTerm direction=horizontal<CR>", desc = "打开一个底部终端" },
    { "<C-/>", "gcc", desc = "注释当前行", remap = true },
    { "<C-/>", "gc", desc = "注释多行", remap = true, mode = "v" },
    { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format buffer", mode = { "n", "v" } },
    { "<leader>m", group = "Markdown" },
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Preview" },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Preview" },
})


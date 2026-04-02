-- 1. 定义你想使用的颜色组名称
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")

-- 2. 利用 hook 在 Neovim 启动时设置颜色（fg 是线条颜色）
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- 3. 启用 IBL
require("ibl").setup({
	indent = {
		highlight = highlight, -- 应用上面定义的彩虹颜色
		char = "│", -- 设置竖线字符
	},
	scope = {
		enabled = true, -- 是否高亮当前光标所在的代码块
		show_start = false,
		show_end = false,
	},
})

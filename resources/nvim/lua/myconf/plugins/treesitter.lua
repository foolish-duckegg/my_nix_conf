require("nvim-treesitter.configs").setup({
	-- nixos保持为空列表，原生neovim填写各种需要支持的语言
	ensure_installed = {},
	highlight = {
		enable = true, -- 这个必须为 true，否则混合模式无法识别行类型
		additional_vim_regex_highlighting = false,
	},
})

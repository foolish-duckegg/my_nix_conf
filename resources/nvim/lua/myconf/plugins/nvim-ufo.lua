vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 3
vim.o.foldenable = true
-- vim.o.foldclose = "all"

vim.api.nvim_create_autocmd("FileType", {
	group = fold_admin,
	pattern = { "python", "cpp", "c" }, -- 这些语言逻辑深，建议默认收起
	callback = function()
		-- wo 代表 window-local，只影响当前显示代码的窗口
		vim.wo.foldlevel = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = fold_admin,
	pattern = { "nix", "markdown" }, -- 这些建议全部展开
	callback = function()
		vim.wo.foldlevel = 99
	end,
})

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

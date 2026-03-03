local cmp = require("cmp")
cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- 這是最關鍵的一行
	}, {
		{ name = "buffer" },
	}, {
		{ name = "path" },
	}),
	--	mapping = cmp.mapping.preset.insert({
	--		["<Tab>"] = cmp.mapping.complete(),
	--	}),
	mapping = {
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item() -- 如果补全菜单已打开，按 Tab 选下一项
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump() -- 如果在代码片段里，按 Tab 跳到下一个空位
			else
				fallback() -- 否则执行正常的 Tab 输入
			end
		end, { "i", "s" }), -- i: insert mode, s: select mode

		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item() -- Shift + Tab 选上一项
			elseif require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1) -- Shift + Tab 跳回上一个代码片段位置
			else
				fallback()
			end
		end, { "i", "s" }),

		-- 别忘了回车确认补全！
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})

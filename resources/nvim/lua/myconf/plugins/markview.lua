-- require("markview").setup({
-- 	preview = { enable = true },
-- 	hybrid_mode = true,
-- 	-- 确保包含这些模式，否则在插入模式下可能不会切换
-- 	modes = { "n", "i", "no", "c" },
--
-- 	-- callbacks = {
-- 	-- 	-- 核心：当 markview 附加到 buffer 时触发
-- 	-- 	on_enable = function(_, buffer)
-- 	-- 		-- 使用 vim.wo[0] 确保作用于当前活动窗口
-- 	-- 		vim.wo.wrap = true
-- 	-- 		vim.wo.linebreak = true
-- 	-- 		vim.wo.breakindent = false -- 必须设为 false，否则 markview 的图标会错位
-- 	-- 	end,
-- 	-- },
-- 	--
-- 	-- -- 如果你要在特定组件开启换行逻辑
-- 	-- renderers = {
-- 	-- 	block_quotes = { enable = false }, -- 移除内部无效的 wrap 项
-- 	-- 	headings = { enable = true },
-- 	-- 	list_items = { enable = true },
-- 	-- },
-- 	markdown = {
-- 		list_items = {
-- 			shift_width = function(buffer, item)
-- 				---@type integer Parent list items indent. Must be at least 1.
-- 				local parent_indnet = math.max(1, item.indent - vim.bo[buffer].shiftwidth)
-- 				return item.indent * (1 / (parent_indnet * 2))
-- 			end,
-- 			marker_minus = {
-- 				add_padding = function(_, item)
-- 					return item.indent > 1
-- 				end,
-- 			},
-- 		},
-- 		headings = {
-- 			heading_1 = { icon_hl = "@markup.link", icon = "[%d] " },
-- 			heading_2 = { icon_hl = "@markup.link", icon = "[%d.%d] " },
-- 			heading_3 = { icon_hl = "@markup.link", icon = "[%d.%d.%d] " },
-- 		},
-- 	},
-- })

local spec = require("markview.spec")
-- 1. 获取全量默认配置
spec.config = vim.deepcopy(spec.default)

-- 2. 在这个“拷贝”出来的模板上进行修改
spec.config.preview.enable = true
spec.config.preview.icon_provider = "devicons"
spec.config.preview.modes = { "n", "v", "c" } -- 启用预览的模式
spec.config.preview.hybrid_modes = { "n", "v" } -- 启用混合模式的模式
spec.config.preview.enable_hybrid_mode = true -- 默认关闭混合模式
spec.config.preview.linewise_hybrid_mode = true -- 默认开启行级模式
spec.config.preview.debounce = 0

-- 3. 最后再执行 setup
require("markview").setup(spec.config)

-- require("markview").setup({
-- 	preview = {
-- 		enable = true,
-- 		icon_provider = "devicons",
-- 		modes = { "n", "v", "c", "i", "no" }, -- 启用预览的模式
-- 		hybrid_modes = { "n", "v" }, -- 启用混合模式的模式
-- 		enable_hybrid_mode = true, -- 默认关闭混合模式
-- 		linewise_hybrid_mode = false, -- 默认开启行级模式
-- 	},
-- })

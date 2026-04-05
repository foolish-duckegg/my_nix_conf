require("obsidian").setup({
	-- ui = { enable = false },
	notes_subdir = "00_Inbox",
	new_notes_location = "00_Inbox",
	frontmatter = {
		enabled = false,
	},
	legacy_commands = false,
	picker = { name = "telescope.nvim" },
	workspaces = {
		{
			name = "personal",
			path = "~/app/notes", -- ⚠️ 确保这个文件夹真实存在
		},
	},
	templates = {
		subdir = "99_Templates", -- ⚠️ 确保这个子文件夹在 Vault 内部
		date_format = "%Y-%m-%d",
		time_format = "%H:%M:%s",
		-- 定义自定义变量的替换逻辑
		substitutions = {
			-- 当模板里出现 {{my_title}} 时，执行这个函数
			my_title = function()
				-- 读取我们在快捷键里注入的 Buffer 变量，如果没有就返回 "Untitled"
				return vim.b.my_custom_title or "Untitled"
			end,

			-- 当模板里出现 {{my_id}} 时，执行这个函数
			my_id = function()
				return vim.b.my_custom_id or ""
			end,
		},
	},
	note_id_func = function(title)
		return os.date("%Y%m%d-%H%M%S")
	end,

	note_path_func = function(spec)
		-- local path = spec.dir / tostring(spec.id)
		-- if spec.title and spec.title ~= "" then
		-- 	-- 把标题里的空格替换成横杠，保证文件名规范
		-- 	local safe_title = spec.title:gsub(" ", "-")
		-- 	path = path:parent() / (tostring(spec.id) .. "-" .. safe_title .. ".md")
		-- else
		path = spec.dir / (tostring(spec.id) .. ".md")
		-- end
		return path
	end,
})

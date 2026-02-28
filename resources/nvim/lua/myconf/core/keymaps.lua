vim.g.mapleader = " "

local keymap = vim.keymap

-- 插入模式
keymap.set("i", "jk", "<ESC>")

-- 视觉模式
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 一下文件都有定义新的快捷键
-- hop.lua
-- toggleterm.lua
-- keymaps.lua 

require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- ============================
--        基础移动快捷键
-- ============================

map("n", "<S-j>", "L", { desc = "移动到屏幕尾行" })
map("n", "<S-k>", "H", { desc = "移动到屏幕顶行" })
map("v", "<S-j>", "L", { desc = "选择到屏幕尾行" })
map("v", "<S-k>", "H", { desc = "选择到屏幕顶行" })

map("n", "<S-h>", "^", { desc = "移动到行首" })
map("n", "<S-l>", "$", { desc = "移动到行尾" })
map("v", "<S-h>", "^", { desc = "选择到行首" })
map("v", "<S-l>", "$", { desc = "选择到行尾" })

-- ============================
--        LSP 快捷键
-- ============================

map("n", "<S-u>", vim.lsp.buf.hover, { desc = "显示悬停信息" })

-- ============================
--        模式切换快捷键
-- ============================

map("i", "jk", "<Esc>", { desc = "退出插入模式" })
map("v", "jk", "<Esc>", { desc = "退出可视模式" })
map("c", "jk", "<C-c>", { desc = "取消命令并退出" })
map("t", "jk", "<C-\\><C-n>", { desc = "退出终端模式" })

-- ============================
--        Copilot 快捷键
-- ============================

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "接受 Copilot 建议", noremap = true, silent = true })

-- ============================
--        行移动快捷键
-- ============================

-- 普通模式下移动当前行
map("n", "<A-j>", ":m .+1<CR>==", { desc = "向下移动当前行" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "向上移动当前行" })

-- 插入模式下移动当前行
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "向下移动当前行" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "向上移动当前行" })

-- 可视模式下移动选中的行
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "向下移动选中行" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "向上移动选中行" })

-- ============================
--        Harpoon 快捷键
-- ============================

map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "添加文件到 Harpoon" })

map("n", "<leader>h", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "打开 Harpoon 菜单" })

-- 快速跳转到标记的文件
map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end, { desc = "跳转到 Harpoon 文件 1" })

map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end, { desc = "跳转到 Harpoon 文件 2" })

map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end, { desc = "跳转到 Harpoon 文件 3" })

map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end, { desc = "跳转到 Harpoon 文件 4" })

-- 在 Harpoon 列表中导航
map("n", "<C-S-p>", function()
  require("harpoon"):list():prev()
end, { desc = "Harpoon 上一个文件" })

map("n", "<C-S-n>", function()
  require("harpoon"):list():next()
end, { desc = "Harpoon 下一个文件" })

-- ============================
--      Persistence 会话管理
-- ============================

map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "恢复当前目录会话" })

map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "恢复上次会话" })

map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "停止保存当前会话" })

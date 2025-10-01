require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", "<S-j>", "L", { desc = "移动到屏幕尾行" })
map("n", "<S-k>", "H", { desc = "移动到屏幕顶行" })
map("v", "<S-j>", "L", { desc = "选择到屏幕尾行" })
map("v", "<S-k>", "H", { desc = "选择到屏幕顶行" })

map("n", "<S-h>", "^", { desc = "移动到行首" })
map("n", "<S-l>", "$", { desc = "移动到行尾" })
map("v", "<S-h>", "^", { desc = "选择到行首" })
map("v", "<S-l>", "$", { desc = "选择到行尾" })

map("n", "<S-u>", vim.lsp.buf.hover, { desc = "Show hover information" })

map("i", "jk", "<Esc>", { desc = "退出插入模式" })
map("v", "jk", "<Esc>", { desc = "退出可视模式" })
map("c", "jk", "<C-c>", { desc = "取消命令并退出" })
map("t", "jk", "<C-\\><C-n>", { desc = "退出终端模式" })

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- 普通模式下移动当前行
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- 插入模式下移动当前行
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up' })

-- 可视模式下移动选中的行
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })


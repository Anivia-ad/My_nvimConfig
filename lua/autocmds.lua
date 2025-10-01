require "nvchad.autocmds"

-- 默认显示相对行号和绝对行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 创建自动命令组
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- 在插入模式下显示绝对行号，其他模式显示相对行号
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { group = numbertoggle, command = "set relativenumber" }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { group = numbertoggle, command = "set norelativenumber" }
)

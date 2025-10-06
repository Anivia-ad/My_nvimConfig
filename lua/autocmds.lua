require "nvchad.autocmds"

-- 默认显示相对行号和绝对行号
vim.opt.number = true
vim.opt.relativenumber = true

local api = vim.api
local numbertoggle = api.nvim_create_augroup("numbertoggle", { clear = true })

-- 在插入模式下显示绝对行号，其他模式显示相对行号
api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { group = numbertoggle, command = "set relativenumber" }
)

api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { group = numbertoggle, command = "set norelativenumber" }
)

-- 自定义高亮组颜色
api.nvim_set_hl(0, "YankHighlight", {
  bg = "#c8c094",
  fg = "#1f1f28", -- 前景色：深色文字（可选，确保文字可读）
})

-- 复制后高亮显示
api.nvim_create_autocmd("TextYankPost", {
  desc = "复制后高亮显示",
  group = api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = "YankHighlight", -- 使用自定义高亮组
      timeout = 400, -- 高亮持续时间(毫秒)
    }
  end,
})


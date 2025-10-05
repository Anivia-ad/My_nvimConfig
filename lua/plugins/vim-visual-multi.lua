return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-m>",           -- Ctrl+d 选择下一个相同单词
        ["Find Subword Under"] = "<C-m>",
        ["Select All"] = "<C-S-l>",         -- Ctrl+Shift+l 选择所有
        ["Skip Region"] = "<C-x>",          -- Ctrl+x 跳过当前
        ["Remove Region"] = "<C-p>",        -- Ctrl+p 取消选择
        ["Add Cursor Down"] = "<C-Down>",   -- Ctrl+Down 向下添加光标
        ["Add Cursor Up"] = "<C-Up>",       -- Ctrl+Up 向上添加光标
      }
    end,
  },
}

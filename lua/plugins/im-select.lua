return {
  {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    config = function()
      require("im_select").setup({
        -- 默认输入法：英文
        default_im_select = "1033",
        -- im-select.exe 的路径
        default_command = "/mnt/d/Tools/im-select/im-select.exe",
        -- 设置切换时机
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
        set_previous_events = { "InsertEnter" },
      })
    end,
  },
}

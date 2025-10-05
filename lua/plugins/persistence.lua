return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  config = function()
    require("persistence").setup {
      dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    }

    -- 保存会话前关闭 NvimTree
    vim.api.nvim_create_autocmd("User", {
      pattern = "SessionSavePre",
      callback = function()
        -- 关闭 NvimTree
        local nvim_tree = require "nvim-tree.api"
        if nvim_tree.tree.is_visible() then
          nvim_tree.tree.close()
        end
      end,
    })

    -- 恢复会话后重新打开 NvimTree
    vim.api.nvim_create_autocmd("User", {
      pattern = "SessionLoadPost",
      callback = function()
        -- 可选：自动打开 NvimTree
        -- require("nvim-tree.api").tree.open()
      end,
    })
  end,
}

return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    require("mason-nvim-dap").setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    }
  end,
}

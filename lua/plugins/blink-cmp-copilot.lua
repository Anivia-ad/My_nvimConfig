return {
  -- 1. First, install copilot.lua
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },  -- Disable default suggestion module
        panel = { enabled = false },       -- Disable default panel module
      })
    end,
  },

  -- 2. Install blink.cmp (if not already installed)
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- 3. Add blink-cmp-copilot
      {
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    version = "v0.*",
    opts = {
      -- Configure completion sources
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,  -- Increase priority of Copilot suggestions
            async = true,
            -- Optional: Add Copilot icon support
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },
      
      -- Optional: Configure appearance, add Copilot icon
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
        kind_icons = {
          Copilot = "",
          Text = '??',
          Method = '??',
          Function = '??',
          Constructor = '',
          Field = '??',
          Variable = '??',
          Class = '??',
          Interface = '',
          Module = '',
          Property = '??',
          Unit = '??',
          Value = '??',
          Enum = '',
          Keyword = '??',
          Snippet = '',
          Color = '??',
          File = '??',
          Reference = '??',
          Folder = '??',
          EnumMember = '',
          Constant = '??',
          Struct = '??',
          Event = '',
          Operator = '??',
          TypeParameter = '',
        },
      },
      
      -- Other blink.cmp configurations
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-l>"] = { "accept" },  -- Ctrl+l to accept Copilot suggestion
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
    },
  },
}

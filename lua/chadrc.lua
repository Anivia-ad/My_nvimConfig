-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "     ❅                  ❅         *                   ",
    "         *          ❅                  ❅       *      ",
    "  ███╗*  ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║ ❅ ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗ *██║   ██║██║   ██║██║██╔████╔██║*",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║*╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝*╚═════╝ ❅ ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "              ❅          *                    ❅       ",
    "  *         ❅                  ❅         *            ",
    "        ❅       *              ❅         *            ",
    "                                                       ",
  },
}
M.ui = {
  cmp = {
    icons_left = false, -- only for non-atom styles!
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    abbr_maxwidth = 60,
    -- for tailwind, css lsp etc
    format_colors = { lsp = true, icon = "󱓻" },
  },

  statusline = {
    theme = "default",
    separator_style = "round",
  },
}

return M

-- return 
-- {
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     priority = 1000,
--     lazy = false,
--     config = function()
--         vim.cmd[[colorscheme kanagawa-dragon]]

--         local kanagawa_colors = require("kanagawa.colors").setup()
--         local palette = kanagawa_colors.palette

--         vim.api.nvim_set_hl(0, "LineNr", { fg = palette.winterGreen, bg = "NONE" })
--         vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.dragonYellow, bold = true, bg = "NONE" })
--     end
-- }

-- {
--   "navarasu/onedark.nvim",
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('onedark').setup {
--       style = 'darker'
--     }
--     -- Enable theme
--     require('onedark').load()
--   end
-- }

return {
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,
        lazy = false,
    },

    {
        "navarasu/onedark.nvim",
        priority = 1000,
        lazy = false,
    }
}


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
-- show warnings/errors descriptions in 1 second (by defaut it takes 4 seconds)
vim.o.updatetime = 1000
-- vim.o.relativenumber = true

require("vim-options")
require("lazy").setup("plugins")
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("keymaps")

require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  },
})

-- START: To load specific theme depend on command --

local args = vim.fn.argv()
local theme_found = false

for _, arg in ipairs(args) do
  if arg:match("^Theme:") then
    theme_found = true
    local theme = arg:match("^Theme:(.*)")
    if theme == "onedark" then
      require("onedark").setup { style = "darker" }
      require("onedark").load()
    elseif theme == "kanagawa" then
      vim.cmd.colorscheme("kanagawa-dragon")
    end
  end
end

if not theme_found then
  vim.cmd.colorscheme("kanagawa-dragon")
end

if vim.g.colors_name == "kanagawa-dragon" or not theme_found then
  local kanagawa_colors = require("kanagawa.colors").setup()
  local palette = kanagawa_colors.palette

  vim.api.nvim_set_hl(0, "LineNr", { fg = palette.winterGreen, bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.dragonYellow, bold = true, bg = "NONE" })
end

-- END --

-- vim.cmd [[
--   autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]]

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- Specific indents for files with specific extensions
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "xml", "javascriptreact", "typescriptreact", "tsx", "jsx", "vue", "svelte" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
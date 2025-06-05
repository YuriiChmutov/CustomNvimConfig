return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- using buffers (on tabs)
          separator_style = "slant", -- separators style 
          diagnostics = "nvim_lsp", -- show diagnostics
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true
            }
          }
        },
      })
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
    end,
  },
}

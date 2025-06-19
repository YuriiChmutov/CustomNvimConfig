return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = 'master',
    lazy = false,
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "go", "c_sharp", "javascript", "rust"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

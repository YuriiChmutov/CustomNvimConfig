return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local map = vim.keymap.set
            local builtin = require("telescope.builtin")
            map("n", "<C-p>", builtin.find_files, { desc = "Find files" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
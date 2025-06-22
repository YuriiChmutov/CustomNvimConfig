return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Lua
            lspconfig.lua_ls.setup({})

            -- Go
            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                    },
                },
            })

            -- Rust + Clippy
            lspconfig.rust_analyzer.setup({
               -- capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            })

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- TypeScript & JavaScript
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { desc = "Signature Help" }) -- параметры
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })

            vim.cmd [[
                autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false })
            ]]
        end
    }
}

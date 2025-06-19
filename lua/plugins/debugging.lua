return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go"
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        require("dapui").setup()
        require("dap-go").setup()

        dap.adapters.codelldb = {
          type = 'server',
          port = "${port}",
          executable = {
             command = '/home/yuriich/.local/share/nvim/mason/bin/codelldb',
             args = {"--port", "${port}"},
          }
        }

        dap.configurations.rust = {
          {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              -- собери бинарник перед дебагом
              vim.fn.jobstart("cargo build")
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
          },
        }


        dap.listeners.before.attach.dapui_config = function()
        dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
        dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
        end

        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    end
}

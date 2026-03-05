return
{
    "rcarriga/nvim-dap-ui",
    dependencies =
    { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
        }
        -- dap.adapters.gdb = {
        --     type = "executable",
        --     command = "gdb",
        --     args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        -- }
        dap.configurations.cpp = {
            {
                name = "Launch Active file",
                type = "cppdbg",
                request = "launch",
                program = "${fileBasenameNoExtension}",
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = "Launch fucking bullshit ass fucking client",
                type = "cppdbg",
                request = "launch",
                program = "${workspaceFolder}/gfclient_download_noasan",
                cwd = '${workspaceFolder}',
                stopAtEntry = false,
            },
            {
                name = "asan",
                type = "cppdbg",
                request = "launch",
                program = "${workspaceFolder}/gfclient_download_noasan",
                cwd = '${workspaceFolder}',
                stopAtEntry = false,
            },
            {
                name = "Launch psi",
                type = "cppdbg",
                request = "launch",
                program = "build/psi",
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        -- dap.listeners.before.event_terminated.dapui_config = function()
        --     dapui.close()
        -- end
        -- dap.listeners.before.event_exited.dapui_config = function()
        --     dapui.close()
        -- end
    end
}

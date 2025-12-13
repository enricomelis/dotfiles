return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- specific plugin to ensure DAP adapters are installed via Mason
        "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    -- 1. Use 'config', not 'opts'
    config = function()
        local dap = require("dap")

        -- 2. Setup Mason-Nvim-Dap to ensure codelldb is actually installed
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb" },
            automatic_installation = true,
        })

        -- 3. Configure the adapter
        -- Note: We use an absolute path for safety, relying on Mason's install path
        if not dap.adapters["codelldb"] then
            dap.adapters["codelldb"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    -- Mason installs binaries here
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = { "--port", "${port}" },
                },
            }
        end

        -- 4. Configure C/C++ configurations
        for _, lang in ipairs({ "c", "cpp" }) do
            dap.configurations[lang] = {
                {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch file",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "codelldb",
                    request = "attach",
                    name = "Attach to process",
                    pid = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end
    end,
}

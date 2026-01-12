return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		local map = vim.keymap.set
		map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
		map("n", "<leader>dc", "<cmd> DapToggleBreakpoint <CR>")
		map("n", "<leader>dr", "<cmd> DapContinue <CR>")
		map("n", "<leader>si", "<cmd> DapStepInto <CR>")
		map("n", "<leader>so", "<cmd> DapStepOut <CR>")
	end,
}

-- Stepping:
--
-- - `DapRestartFrame`: Restart the active sessions' current frame
-- - `DapStepInto`: Step into the current expression
-- - `DapStepOut`: Step out of the current scope
-- - `DapStepOver`: Step over the current line
-- - `DapPause`: Pause the current thread or pick a thread to pause

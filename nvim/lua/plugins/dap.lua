return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		-- DAP (Debugger) integration setup
		local xcodebuild_dap = require("xcodebuild.integrations.dap")
		local dap = require("dap")
		require("dap-python").setup("python3")

		local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
		local liblldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib"
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
			},
			env = {
				LIBLLDB_PATH = liblldb_path,
			},
		}

		-- 2. Define configurations that USE this adapter
		--    This setup compiles and runs the *current file*
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb", -- Matches the adapter name
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.expand("%:p:h") .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- You can reuse the same config for C and Rust
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
		xcodebuild_dap.setup()

		-- Your keymaps for debugging are perfect and remain the same
		vim.keymap.set("n", "<leader>xcdd", xcodebuild_dap.build_and_debug, { desc = "Build & Debug" })
		vim.keymap.set("n", "<leader>xcdr", xcodebuild_dap.debug_without_build, { desc = "Debug Without Building" })
		vim.keymap.set("n", "<leader>xcdt", xcodebuild_dap.debug_tests, { desc = "Debug Tests" })
		vim.keymap.set("n", "<leader>xcdT", xcodebuild_dap.debug_class_tests, { desc = "Debug Class Tests" })

		-- General debugger keymaps
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<leader>dt", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "DAP: Terminate" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: Set Conditional Breakpoint" })
		vim.keymap.set("n", "<leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "DAP: Set Log Point" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })
	end,
}

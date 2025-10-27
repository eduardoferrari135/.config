return {
	"rcarriga/nvim-dap-ui",
	-- Dependencies are automatically loaded by lazy.nvim
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	-- Keymaps for nvim-dap-ui
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle DAP UI",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "Eval",
			mode = { "n", "v" }, -- Evaluate in normal and visual mode
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		-- Setup dapui
		dapui.setup({
			controls = {
				element = "repl",
				enabled = true,
			},
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			icons = { collapsed = "", expanded = "", current_frame = "" },
			layouts = {
				{
					elements = {
						{ id = "stacks", size = 0.25 },
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 60,
				},
				{
					elements = {
						{ id = "repl", size = 0.35 },
						{ id = "console", size = 0.65 },
					},
					position = "bottom",
					size = 10,
				},
			},
		})

		-- Automatically open/close dap-ui when a debug session starts/stops
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}

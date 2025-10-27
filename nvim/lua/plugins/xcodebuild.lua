return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",

		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-tree.lua", -- (optional) to manage project files
		"stevearc/oil.nvim", -- (optional) to manage project files
	},
	config = function()
		require("xcodebuild").setup({
			logs = {
				auto_open_on_success_tests = false, -- open logs when tests succeeded
				auto_open_on_failed_tests = false, -- open logs when tests failed
				auto_open_on_success_build = false, -- open logs when build succeeded
				auto_open_on_failed_build = true, -- open logs when build failed
				auto_close_on_app_launch = true, -- close logs when app is launched
				auto_close_on_success_build = false, -- close logs when build succeeded (only if auto_open_on_success_build=false)
				auto_focus = true, -- focus logs buffer when opened
				filetype = "", -- file type set for buffer with logs
				open_command = "silent botright 20split {path}", -- command used to open logs panel. You must use {path} variable to load the log file
				logs_formatter = "xcbeautify --disable-colored-output", -- command used to format logs, you can use "" to skip formatting
				only_summary = false, -- if true logs won't be displayed, just xcodebuild.nvim summary
				live_logs = true, -- if true logs will be updated in real-time
				show_warnings = true, -- show warnings in logs summary
			},
			code_coverage = {
				enabled = true,
			},
			integrations = {
				xcodebuild_offline = {
					enabled = true,
				},
				pymobiledevice = {
					enabled = true,
				},
			},
		})
	end,
}

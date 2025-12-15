return {
	"olrtg/nvim-emmet",
	-- Lazy-load the plugin when a specific keymap is triggered
	event = "BufReadPost",
	config = function()
		-- Configure keymaps for Emmet actions
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end,
}

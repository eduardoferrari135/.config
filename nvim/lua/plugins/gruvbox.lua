return {
	{
		"sainnhe/gruvbox-material",
		-- config = function()
		-- 	vim.g.gruvbox_material_foreground = "mix"
		-- end,
	},

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
}

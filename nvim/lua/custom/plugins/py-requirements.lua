return {
	'MeanderingProgrammer/py-requirements.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('py-requirements').setup({
			-- Enabled by default if you do not use `nvim-cmp` set to false
			enable_cmp = true,
			-- Specify what file patterns to apply the plugin to
			-- For info on patterns, see :h pattern
			file_patterns = { 'requirements.txt' },
			-- For available options, see :h vim.lsp.util.open_floating_preview
			float_opts = { border = 'rounded' },
			filter = {
				-- If set to true pull only final release versions, this will ignore alpha,
				-- beta, release candidate, post release, and developmental release versions
				final_release = false,
				-- If set to true (default value) filter out yanked package versions
				yanked = true,
			},
		})
	end,
}

return {
	'nvim-tree/nvim-web-devicons',
	'ryanoasis/vim-devicons',
	'glepnir/galaxyline.nvim',
	branch = 'main',
	config = function()
		require('my_statusline')
	end,
	requires = { 'nvim-tree/nvim-web-devicons', opt = true },
}

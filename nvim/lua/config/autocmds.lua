-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local spellGroup = vim.api.nvim_create_augroup("MarkdownSpell", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = spellGroup,
	pattern = "markdown",
	callback = function()
		-- Use vim.bo (buffer-local option) to apply only to this file
		vim.bo.spell = true
		vim.bo.spelllang = "pt,en_us"
	end,
})

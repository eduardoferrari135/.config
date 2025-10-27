require "nvchad.options"

-- add yours here!

local o = vim.opt
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.spelllang = { "en", "pt" }
--
-- Folding
o.foldmethod = "indent"
o.foldenable = true
o.foldlevel = 99

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en", "pt" }
  end,
})

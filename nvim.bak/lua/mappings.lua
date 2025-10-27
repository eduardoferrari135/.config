require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>py", "<cmd>w<cr><cmd>!python %<cr>", { desc = "Save and run Python file" })
map("n", "<leader>ca",  vim.lsp.buf.code_action, { desc = "LSP Code Action" })

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Escape terminal mode" })
map("n", "<leader>ip", function()
  vim.cmd("enew")                  -- create a new empty buffer
  vim.cmd("term ipython")           -- open a terminal and run ipython
  vim.cmd("startinsert")            -- automatically start in insert mode
end, { desc = "Open new buffer and run IPython" })


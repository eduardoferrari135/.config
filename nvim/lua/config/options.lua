-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt
opt.expandtab = true
opt.tabstop = 8
opt.softtabstop = 8 -- Number of spaces inserted instead of a TAB character
opt.shiftwidth = 8 -- Number of spaces inserted when indenting
opt.wrap = true
opt.spell = true
opt.spelllang = "pt,en_us"

vim.keymap.set("n", "<leader>xcl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>xcb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>xcr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>xct", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>xcT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
vim.keymap.set("n", "<leader>Xc", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
vim.keymap.set("n", "<leader>xcd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>xcp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
vim.keymap.set("n", "<leader>xcc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>xcC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>xcq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

-- Navigate buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>k", "<cmd>bdelete<cr>", { desc = "Close buffer" })

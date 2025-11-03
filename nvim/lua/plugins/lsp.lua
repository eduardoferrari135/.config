local llvm_prefix = vim.fn.system("brew --prefix llvm | tr -d '\n'")
local clangd_path = llvm_prefix .. "/bin/clangd"

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruff = {},
				pyright = {},
				gopls = {},
				sourcekit = {
					cmd = {
						"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
					},
					filetypes = { "swift" },
					on_init = function(client)
						client.server_capabilities.diagnosticProvider = {
							interFileDependencies = true,
							workspaceDiagnostics = false,
						}
					end,
				},
				clangd = {
					cmd = { clangd_path },
					filetypes = {
						"c",
						"cpp",
						"objc",
						"objcpp",
						"cuda",
					},
				},
			},
			inlay_hints = {
				enabled = true,
			},
		},
	},
}

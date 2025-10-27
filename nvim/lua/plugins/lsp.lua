return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- 1. Add ruff
				ruff = {
					-- THIS IS THE CORRECTED PART:
					-- Add your on_attach logic directly here.
					-- LazyVim merges this with its default on_attach.
					on_attach = function(client, bufnr)
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end,
				},

				-- 2. Configure Pyright to defer linting and imports to Ruff
				pyright = {
					settings = {
						pyright = {
							-- Tell Pyright not to handle imports (Ruff will do this)
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								-- Tell Pyright to ignore all files for analysis (Ruff will handle most diagnostics/linting)
								ignore = { "*" },
								-- Set type checking mode (Pyright's main feature)
								typeCheckingMode = "basic",
							},
						},
					},
				},
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
			},
			inlay_hints = {
				enabled = false,
			},

			-- 3. REMOVE the old setup block
			setup = {
				-- The ruff function that was here is no longer needed
				-- as it has been moved into servers.ruff.on_attach
			},
		},
	},
}

return {
	'saecki/crates.nvim',
	tag = 'stable',
	config = function()
		require('crates').setup(require("crates").setup {
			smart_insert = true,
			insert_closing_quote = true,
			autoload = true,
			autoupdate = true,
			autoupdate_throttle = 250,
			loading_indicator = true,
			date_format = "%Y-%m-%d",
			thousands_separator = ".",
			notification_title = "Crates",
			curl_args = { "-sL", "--retry", "1" },
			max_parallel_requests = 80,
			open_programs = { "xdg-open", "open" },
			text = {
				loading = "   Loading",
				version = "   %s",
				prerelease = "   %s",
				yanked = "   %s",
				nomatch = "   No match",
				upgrade = "   %s",
				error = "   Error fetching crate",
			},
			highlight = {
				loading = "CratesNvimLoading",
				version = "CratesNvimVersion",
				prerelease = "CratesNvimPreRelease",
				yanked = "CratesNvimYanked",
				nomatch = "CratesNvimNoMatch",
				upgrade = "CratesNvimUpgrade",
				error = "CratesNvimError",
			},
			popup = {
				autofocus = false,
				hide_on_select = false,
				copy_register = '"',
				style = "minimal",
				border = "none",
				show_version_date = false,
				show_dependency_version = true,
				max_height = 30,
				min_width = 20,
				padding = 1,
				text = {
					title = " %s",
					pill_left = "",
					pill_right = "",
					description = "%s",
					created_label = " created        ",
					created = "%s",
					updated_label = " updated        ",
					updated = "%s",
					downloads_label = " downloads      ",
					downloads = "%s",
					homepage_label = " homepage       ",
					homepage = "%s",
					repository_label = " repository     ",
					repository = "%s",
					documentation_label = " documentation  ",
					documentation = "%s",
					crates_io_label = " crates.io      ",
					crates_io = "%s",
					categories_label = " categories     ",
					keywords_label = " keywords       ",
					version = "  %s",
					prerelease = " %s",
					yanked = " %s",
					version_date = "  %s",
					feature = "  %s",
					enabled = " %s",
					transitive = " %s",
					normal_dependencies_title = " Dependencies",
					build_dependencies_title = " Build dependencies",
					dev_dependencies_title = " Dev dependencies",
					dependency = "  %s",
					optional = " %s",
					dependency_version = "  %s",
					loading = "  ",
				},
				highlight = {
					title = "CratesNvimPopupTitle",
					pill_text = "CratesNvimPopupPillText",
					pill_border = "CratesNvimPopupPillBorder",
					description = "CratesNvimPopupDescription",
					created_label = "CratesNvimPopupLabel",
					created = "CratesNvimPopupValue",
					updated_label = "CratesNvimPopupLabel",
					updated = "CratesNvimPopupValue",
					downloads_label = "CratesNvimPopupLabel",
					downloads = "CratesNvimPopupValue",
					homepage_label = "CratesNvimPopupLabel",
					homepage = "CratesNvimPopupUrl",
					repository_label = "CratesNvimPopupLabel",
					repository = "CratesNvimPopupUrl",
					documentation_label = "CratesNvimPopupLabel",
					documentation = "CratesNvimPopupUrl",
					crates_io_label = "CratesNvimPopupLabel",
					crates_io = "CratesNvimPopupUrl",
					categories_label = "CratesNvimPopupLabel",
					keywords_label = "CratesNvimPopupLabel",
					version = "CratesNvimPopupVersion",
					prerelease = "CratesNvimPopupPreRelease",
					yanked = "CratesNvimPopupYanked",
					version_date = "CratesNvimPopupVersionDate",
					feature = "CratesNvimPopupFeature",
					enabled = "CratesNvimPopupEnabled",
					transitive = "CratesNvimPopupTransitive",
					normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
					build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
					dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
					dependency = "CratesNvimPopupDependency",
					optional = "CratesNvimPopupOptional",
					dependency_version = "CratesNvimPopupDependencyVersion",
					loading = "CratesNvimPopupLoading",
				},
				keys = {
					hide = { "q", "<esc>" },
					open_url = { "<cr>" },
					select = { "<cr>" },
					select_alt = { "s" },
					toggle_feature = { "<cr>" },
					copy_value = { "yy" },
					goto_item = { "gd", "K", "<C-LeftMouse>" },
					jump_forward = { "<c-i>" },
					jump_back = { "<c-o>", "<C-RightMouse>" },
				},
			},
			null_ls = {
				enabled = false,
				name = "Crates",
			},
			on_attach = function(bufnr) end,
		})
		local crates = require("crates")
		local opts = { silent = true, desc = "Crates" } -- default options including description prefix

		-- General
		vim.keymap.set("n", "<leader>ct", crates.toggle,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Toggle crate information" }))
		vim.keymap.set("n", "<leader>cr", crates.reload,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Reload crate information" }))

		-- Popup Displays
		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Show versions popup" }))
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Show features popup" }))
		vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Show dependencies popup" }))

		-- Update and Upgrade Crates
		vim.keymap.set("n", "<leader>cu", crates.update_crate,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Update crate" }))
		vim.keymap.set("v", "<leader>cu", crates.update_crates,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Update selected crates" }))
		vim.keymap.set("n", "<leader>ca", crates.update_all_crates,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Update all crates" }))
		vim.keymap.set("n", "<leader>cU", crates.upgrade_crate,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Upgrade crate" }))
		vim.keymap.set("v", "<leader>cU", crates.upgrade_crates,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Upgrade selected crates" }))
		vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Upgrade all crates" }))

		-- Crate Table Manipulations
		vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Expand crate to inline table" }))
		vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Extract crate into table" }))

		-- Open Web Pages
		vim.keymap.set("n", "<leader>cH", crates.open_homepage,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Open crate homepage" }))
		vim.keymap.set("n", "<leader>cR", crates.open_repository,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Open crate repository" }))
		vim.keymap.set("n", "<leader>cD", crates.open_documentation,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Open crate documentation" }))
		vim.keymap.set("n", "<leader>cC", crates.open_crates_io,
			vim.tbl_extend("force", opts, { desc = opts.desc .. ": Open crate on crates.io" }))
	end,
}

return {
	{
		"saghen/blink.cmp",
		opts = {
			completion = {
				ghost_text = {
					enabled = false,
				},
			},
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},
		},
	},
}

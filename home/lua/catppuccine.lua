require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.50, -- percentage of the shade to apply to the inactive window
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		dashboard = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = {}, -- Change the style of comments
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "bold" },
			properties = {},
			types = {},
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
	},
})

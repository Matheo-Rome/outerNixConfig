require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	cmdline = {
		enable = true,
		format = {
			-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			-- view: (default is cmdline view)
			-- opts: any options passed to the view
			-- icon_hl_group: optional hl_group for the icon
			-- title: set to anything or empty string to hide
			cmdline = { pattern = "^:", icon = "  :", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = "   ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "   ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			-- lua = false, -- to disable a format, set to `false`
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
require("telescope").load_extension("noice")

local function on_resize()
	local width = vim.api.nvim_win_get_width(0)
	require("notify").setup({
		max_width = math.floor(width / 2),
	})
end

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		on_resize()
	end,
})

require("notify").setup({
	background_colour = "#000000",
	render = "compact",
	on_open = function(win)
		vim.api.nvim_win_set_config(win, { focusable = false })
	end,
	timeout = 1,
	max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "",
		WARN = "",
	},
})

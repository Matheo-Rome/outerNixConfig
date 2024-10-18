local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" }) -- Rosewater (soft red/pink)
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" }) -- Yellow (warm yellow)
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" }) -- Peach (light orange)
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" }) -- Green (soft green)
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" }) -- Mauve (purple/violet)
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89DCEB" }) -- Sky (light cyan)
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" }) -- Blue (calm blue)
	vim.api.nvim_set_hl(0, "RainbowSelect", { fg = "#00BFFF" })
end)

require("ibl").setup({
	indent = {
		highlight = highlight,
		char = "│",
	},
	scope = {
		highlight = { "RainbowSelect" },
		show_start = false,
		show_end = false,
		char = "│",
	},
	exclude = { filetypes = { "dashboard" } },
})
vim.g.rainbow_delimiters = { highlight = highlight }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

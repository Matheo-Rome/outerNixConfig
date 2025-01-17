-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Tweaked: Xutupax
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  white    = '#ffffff',
  darkgray = '#3d3d3d',
  gray     = '#5A5A5A',
  lightgray= '#807d7d',
}

local curr_color = "#ec5f67"

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = { left = "", right = "" },
		theme = {
			-- theme = 'dracula-nvim',
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = {
				a = { bg = colors.darkgray },
				b = { bg = colors.gray },
				c = { fg = colors.fg, bg = colors.bg },
			},
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {
			{
				function()
					return ""
				end,
				separator = { right = "" },
			},
		},
		lualine_b = {
			{
				function()
					return ""
				end,
				separator = { right = "" },
			},
		},
		lualine_y = {},
		lualine_z = {
			{
				function()
					return ""
				end,
				separator = { right = "", left = "" },
			},
		},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_a(component)
	table.insert(config.sections.lualine_a, component)
end

local function ins_b(component)
	table.insert(config.sections.lualine_b, component)
end

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function ins_z(component)
	table.insert(config.sections.lualine_z, component)
end

ins_a({
	function()
		return "   "
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		curr_color = mode_color[vim.fn.mode()]
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 0 }, -- We don't need space before this
})

ins_a({
	-- mode component
	function()
		local symbol = {
			n = "  NORMAL ",
			i = "  INSERT",
			v = "  VISUAL",
			[""] = "  VISUAL BLOCK",
			V = "  VISUAL LINE",
			c = "  COMMAND",
			no = "  NORMAL (no)",
			s = "  SELECT",
			S = "  S-LINE",
			[""] = "  S-BLOCK",
			ic = "  INSERT (completion)",
			R = "  REPLACE",
			Rv = "  V-REPLACE",
			cv = "  COMMAND",
			ce = "  COMMAND",
			r = "  PROMPT",
			rm = "  MORE",
			["r?"] = "  CONFIRM",
			["!"] = "  SHELL",
		}
		return symbol[vim.fn.mode()]
	end,
	color = function()
		return { fg = curr_color }
	end,
	padding = { right = 2 },
})

ins_b({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
	"branch",
	icon = " ",
	color = { fg = colors.violet, gui = "bold" },
})

ins_left({
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_right({
	function()
		return "%="
	end,
})

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
		color_hint = { fg = colors.green },
	},
})

ins_right({
	-- Lsp server name .
	function()
		local msg = "There's more to explore here"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = colors.white, gui = "bold" },
})

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = function()
		return { fg = curr_color, gui = "bold" }
	end,
})
--ins_right {
--  'fileformat',
--  fmt = string.upper,
--  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
--  color = { fg = colors.green, gui = 'bold' },
--}
--ins_left {
--  -- filesize component
--  'filesize',
--  cond = conditions.buffer_not_empty,
--}
ins_right({ "progress", color = { fg = colors.white, gui = "bold" } })

ins_z({
	"location",
	color = function()
		return { bg = curr_color, fg = colors.white }
	end,
	gui = "bold",
})

--ins_right {
--  function()
--    return '▊'
--  end,
--  color = { fg = colors.blue },
--  padding = { left = 2 },
--}

-- Now don't forget to initialize lualine
lualine.setup(config)

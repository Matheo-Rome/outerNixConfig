local opt = vim.opt
local g = vim.g

require("gitsigns").setup()

g.mapleader = " "

vim.cmd([[
     set nowrap
     set nobackup
     set nowritebackup
     set noerrorbells
     set noswapfile
     set showcmdloc statusline
     set timeoutlen=100

     map ; :
     noremap <Up> <Nop>
     noremap <Down> <Nop>
     noremap <Left> <Nop>
     noremap <Right> <Nop>
     nnoremap <C-PageUp> :bprevious<CR>
     nnoremap <C-PageDown> :bnext<CR>
 ]])

local function map(mode, combo, mapping, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- Nvim Tree
map("n", "<leader>t", ":NvimTreeToggle <CR>", { silent = true, noremap = true })

-- Telescope
map("n", "<leader>f", ":Telescope find_files <CR>", { silent = true, noremap = true })
map("n", "<leader>g", ":Telescope <CR>", { silent = true, noremap = true })
map("n", "<leader>n", ":Telescope live_grep <CR>", { silent = true, noremap = true })
map("n", "<leader>o", ":Telescope oldfiles <CR>", { silent = true, noremap = true })

-- Which-key
map("n", "<leader>w", ":WhichKey <CR>", { silent = true, noremap = true })

-- LspSaga
map("n", "<leader>l", ":Lspsaga hover_doc <CR>", { silent = true, noremap = true })
map("n", "<leader>d", ":Lspsaga goto_definition <CR>", { silent = true, noremap = true })

map("n", "<leader>r", ":Lspsaga rename<CR>", { silent = true, noremap = true })
map("n", "<leader>h", ":Lspsaga lsp_finder <CR>", { silent = true, noremap = true })

-- BufferLine displacement
map("n", "<leader>PageUp", ":BufferLineCyclePrev <CR>", { silent = true, noremap = true })
map("n", "<leader>PageDown", ":BufferLineCycleNext <CR>", { silent = true, noremap = true })

-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

-- Remove default vim bar
opt.showmode = false

-- Use mouse
opt.mouse = "a"
opt.mousemoveevent = true

opt.viminfo = ""
opt.viminfofile = "NONE"

opt.encoding = "utf-8"
opt.compatible = false

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Shwo matching braces parenthesis, etc
opt.showmatch = true

-- When scrolling, keep at list 5 lines visible on screen around cursor
opt.scrolloff = 5

-- Show status line
opt.laststatus = 2

-- Show line number relative to the current one
opt.number = true
opt.relativenumber = true

-- Higlight the curosr line
opt.cursorline = true

--Indenation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

--QOL
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.lazyredraw = false

-- Nicer UI settings
opt.termguicolors = true

-- Notify
vim.notify = require("notify")

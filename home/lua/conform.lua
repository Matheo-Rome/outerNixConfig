require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixpkgs-fmt" },
		c = { "clang-format" },
		python = { "isort", "black" },
		cpp = { "clang-format" },
		sh = { "shellcheck" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

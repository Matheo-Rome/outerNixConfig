{ pkgs, ... }:

let 
   mapleadersDefinitions = ''
    " These definitions are repeated in every block that uses <leader> or
    " <localleader> bindings. This is because home-manager's extraConfig text
    " appears too late in the generated config file, so if I define map leaders
    " only in extraConfig, it will appear after the plugin configurations, who
    " sometimes need the definition.
    let mapleader = ","
    let maplocalleader = "\\"
     '';
in
  {
    enable = true;
	vimAlias = true;
        withPython3 = true;
	extraPackages = with pkgs; [
	git
	];
	extraPython3Packages = (ps: with ps; [
	pylint
	numpy
	]);

	plugins = with pkgs.vimPlugins; [
    # File tree  
    nvim-web-devicons
    nvim-tree-lua
    
    vim-nix
    indentLine
      
    # Noice
    (nvim-treesitter.withPlugins (
       plugins: with plugins; [
            nix python cpp c java vim vimdoc query json lua markdown markdown_inline
      ]))

    #QOL
    nvim-autopairs
    better-escape-nvim
    auto-hlsearch-nvim
    nvim-colorizer-lua
    #rainbow-delimiters-nvim
    
    #Git
    gitsigns-nvim

    #Style
    bufferline-nvim 
    #galaxyline-nvim #TODO

    #Displacement
    leap-nvim #TODO

    #Terminal
    toggleterm-nvim

    #Telescope
    popup-nvim
    plenary-nvim
    telescope-nvim

    #Line 
    lualine-nvim
    lualine-lsp-progress

    #Notify 
    nvim-notify

    #Folding
    nvim-ufo

    #LSP
    nvim-cmp
    nvim-lspconfig
    cmp-nvim-lsp 
    luasnip
    cmp_luasnip
    cmp-buffer
    cmp-path
    cmp-cmdline
    friendly-snippets
    lspsaga-nvim
    fidget-nvim

    #Theme
    catppuccin-nvim
	];

	extraConfig = ''
        luafile ~/.config/home-manager/home/lua/lsp.lua
        luafile ~/.config/home-manager/home/lua/catppuccine.lua
        colorscheme catppuccin-mocha
        lua << EOF
        require('nvim-autopairs').setup()
        require("auto-hlsearch").setup()
        require('nvim-web-devicons').setup()
        require'colorizer'.setup()
        require('notify').setup()
          vim.defer_fn(function()
            vim.cmd [[
                luafile ~/.config/home-manager/home/lua/ufo.lua
                luafile ~/.config/home-manager/home/lua/leap.lua
                luafile ~/.config/home-manager/home/lua/lualine.lua
                luafile ~/.config/home-manager/home/lua/init.lua
                luafile ~/.config/home-manager/home/lua/better-escape.lua
                luafile ~/.config/home-manager/home/lua/telescope.lua
                luafile ~/.config/home-manager/home/lua/treesitter.lua
                luafile ~/.config/home-manager/home/lua/bufferline.lua
                luafile ~/.config/home-manager/home/lua/nvim-tree.lua
                luafile ~/.config/home-manager/home/lua/toggleterm.lua
                luafile ~/.config/home-manager/home/lua/snippet.lua
            ]]
        end, 100)
        EOF
    '';

}

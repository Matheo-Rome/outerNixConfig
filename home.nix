{ config, pkgs, lib, ... }:

let
	unstable = import <nixos-unstable> {config.allowUnfree = true;};
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "xutupax";
  home.homeDirectory = "/home/xutupax";

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;
  

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
    #Regular packages
    anki
    bat
    bitwarden
    cargo
    ccls 
    cmake 
    criterion
    discord
    docker
    docker-machine
    dotnet-sdk_8
    exa
    feh
    file
    font-manager
    #gcc 
    gdb
    gnumake
    gtk3
    htop
    imagemagick
    jetbrains-toolbox
    killall
    man-pages
    man-pages-posix 
    meson
    ninja
    libmpdclient
    neofetch
    nil
    oh-my-zsh
    omnisharp-roslyn
    pamixer
    pavucontrol
    rnix-lsp
    nixpkgs-fmt
    pstree
    pyright 
    python3
    pre-commit
    pywal
    procps
    polybar
    scrot
    slack
    spotify
    tmux
    tmux
    tree
    thefuck
    lua-language-server
    unzip
    check-uptime
    valgrind
    vim 
    vscode-fhs
    wget
    xclip
    xdotool
    xsel
    yad
    zathura
    zsh

    #Neovim
    ripgrep 
    clang-tools
    bear

    #Java 
    openjdk
    maven

    #NodeJs
    python310Packages.nodeenv
    nodejs_20
    nodejs_20.pkgs.pnpm
    nodePackages.markdownlint-cli
  ];
  

  home.sessionVariables = {
    EDITOR= "nvim";
    TERMINAL = "alacritty";
    WLR_NO_HARDWARE_CURSORS= "1";
    NIXOS_OZONE_WL = "1";
  };
    
  xsession.windowManager.i3 = import ./home/i3.nix { inherit pkgs lib; };


  programs.alacritty = import ./home/alacritty.nix { inherit pkgs; };
  programs.zsh = import ./home/zsh.nix { inherit pkgs lib; };
  programs.rofi = import ./home/rofi.nix { inherit pkgs; };
  programs.neovim = import ./home/neovim.nix { inherit pkgs; };

  services.polybar = import ./home/poly.nix {inherit pkgs; };
  services.betterlockscreen = import ./home/betterlockscreen.nix { inherit pkgs; };

  #xdg.configFile."polybar".source = pkgs.symlinkJoin {
#name = "polybar-symlinks";
#  paths =
#    let
#      polybar-themes = pkgs.fetchFromGitHub {
#        owner = "adi1090x";
#        repo = "polybar-themes";
#        rev = "c855bfa6cee87783a98f4e995928dfb91810d0c0"; # Or, better, use a specific commit so you don't have to update the sha256-hash all the time
#        sha256 = "VJE6LHz18PYGy6ZIgtc0dpvFEMR4Hs12S9tQ+zpX6KQ="; # Fill this in with the hash that nix provides when you attempt to build your config using this
#      };
#    in
#    [
#      "${polybar-themes}/fonts"
#      "${polybar-themes}/simple"
#    ];
#};

  programs.git = {
    enable = true;
    userName = "Matheo Rome";
    userEmail = "matheo.rome@epita.fr";
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/xutupax/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.

  services.picom.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

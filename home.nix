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
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;


  home.pointerCursor = {
     name = "catppuccin-mocha-mauve-cursors";

     gtk.enable = true;
     x11.enable = true;
     package = pkgs.catppuccin-cursors.mochaMauve;
     size = 32; 
   };
  

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" "VictorMono" "Iosevka"]; })
    font-awesome_6
    #Regular packages
    anki
    arandr
    bat
    bc
    bitwarden
    brightnessctl
    bluetuith
    cargo
    ccls 
    cmake 
    criterion
    discord
    docker
    dotnet-sdk_8
    eza
    feh
    file
    font-manager
    #gcc 
    gdb
    gnupg
    gnumake
    gtk3
    htop
    imagemagick
    #jetbrains-toolbox
    julia
    jq
    killall
    libcaca
    man-pages
    man-pages-posix 
    meson
    ninja
    libmpdclient
    neofetch
    nil
    ntp
    oh-my-zsh
    omnisharp-roslyn
    pamixer
    pavucontrol
    poetry
    mpv
    pinentry
    nixpkgs-fmt
    pstree
    pyright 
    python311Full
    pre-commit
    pywal
    procps
    prismlauncher
    polybar
    scrot
    slack
    #spotify
    tmux
    tree
    thefuck
    librsvg
    lua-language-server
    rust-analyzer
    rofi-rbw
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
    
  xsession.windowManager.i3 = import ./home/nix/i3.nix { inherit pkgs lib; };


  programs.alacritty = import ./home/nix/alacritty.nix { inherit pkgs; };
  programs.zsh = import ./home/nix/zsh.nix { inherit pkgs lib; };
  programs.rofi = import ./home/nix/rofi.nix { inherit pkgs; };
  programs.neovim = import ./home/nix/neovim.nix { inherit pkgs; };

  services.polybar = import ./home/nix/poly.nix {inherit pkgs; };
  services.betterlockscreen = import ./home/nix/betterlockscreen.nix { inherit pkgs; };

  programs.git = {
    enable = true;
    userName = "Matheo Rome";
    userEmail = "matheo.rome@epita.fr";
    signing.key = "0xE8709F8C531AA6CD";
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

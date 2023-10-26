{ pkgs, lib, ...}:

let
  mod = "Mod1";
in
{
  enable = true;
  config = {
    modifier = mod;
    
    menu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
    terminal = "${pkgs.alacritty}/bin/alacritty";

    bars = [];

    startup = [
      {
        command = "feh --bg-scale ~/.config/home-manager/home/outer.png";
        always = true;
      }
      {
        command = "i3-msg workspace 1";
        always = true;
      }
      {
        command = "systemctl --user restart polybar";
        always = true;
      }
      {
        command = "betterlockscreen -u ~/.config/home-manager/home/sol.png";
        always = true;
      }
    ];
    
    gaps = {
      inner = 10;
    };

    window = {
      titlebar = false;
      border = 0;
    };

    keybindings = lib.mkOptionDefault {
      "${mod}+Shift+x" = "exec betterlockscreen -l";
      "--release ${mod}+Shift+s" = "exec scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
      "${mod}+Shift+f" = "exec scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
    };
  };
}

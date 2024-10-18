{ pkgs, lib, ...}:

let
  mod = "Mod1";
  modi = "drun,run,window";
in
{
  enable = true;
  config = {
    modifier = mod;
    

    menu = "${pkgs.rofi}/bin/rofi -show drun -show-icons";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    # terminal = "/home/xutupax/.nix-profile/bin/nixGL ${pkgs.alacritty}/bin/alacritty";

    bars = [];

    startup = [
      {
        command = "feh --bg-scale ~/.config/home-manager/home/pictures/outer.png";
        always = true;
      }
      {
        command = "i3-msg workspace 1";
        always = true;
      }
      {
        command = "polybar -q -r main &";
        always = true;
      }
      {
        command = "betterlockscreen -u ~/.config/home-manager/home/picture/sol.png";
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
      "${mod}+Shift+r" = "restart";
      "--release ${mod}+Shift+s" = "exec scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
      "${mod}+Shift+f" = "exec scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
      "XF86MonBrightnessDown" = "exec ~/.config/home-manager/home/bin/bright -";
      "XF86MonBrightnessUp" = "exec ~/.config/home-manager/home/bin/bright +";

      #Rofi
      "${mod}+g" = "exec rofi -show window -show-icons";
      "${mod}+b" = "exec rofi-rbw";



      #Change Focus
      "${mod}+j" = "focus left";
      "${mod}+k" = "focus down";
      "${mod}+l" = "focus up";
      "${mod}+m" = "focus right";

      "${mod}+Left" = "focus left";
      "${mod}+Down" = "focus down";
      "${mod}+Up" = "focus up";
      "${mod}+Right" = "focus right";

      #Move focused window
      "${mod}+Shift+j" = "move left";
      "${mod}+Shift+k" = "move down";
      "${mod}+Shift+l" = "move up";
      "${mod}+Shift+m" = "move right";

      "${mod}+Shift+Left" = "move left";
      "${mod}+Shift+Down" = "move down";
      "${mod}+Shift+Up" = "move up";
      "${mod}+Shift+Right" = "move right";

      #Toggle tilling/floating
      "${mod}+Shift+space" = "floating toggle";

      #change focus between tiling / floating windows
      "${mod}+space" = "focus mode_toggle";

      #Split in horizontal orientation
      "${mod}+h" = "split h";

      #Split in vertical orientation
      "${mod}+v" = "split v";

      # change container layout (stacked, tabbed, toggle split)
      "${mod}+s" = "layout stacking";
      "${mod}+w" = "layout tabbed";
      "${mod}+e" = "layout toggle split";

    };
  };
}


{ pkgs, ...}:
{ enable = true;

  script = "polybar -q -r main &";
  config = let
      modules = import ../polybar/modules.nix;
      color = import ../polybar/color.nix;
  in {

    "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
    };

    "bar/main" = {
        monitor-strict = true;
        monitor = "eDP-1";
        monitor-fallback = "eDP-2";

        override-redirect = false;

        fixed-center = true;

        width = "100%";
        height = 20;

        offset-x = "1%";
        # offset-y = "2%:-2";
        background = color.background;
        foreground = color.foreground;

        line-size = 2;
        line-color = color.primary;

        border-bottom-size = 4;
        border-top-size = 4;
        border-color = color.background;

        padding = 0;
        module-margin = 0;

        font-0 = "icomoon-feather:size=10;3";
        font-1 = "Iosevka Nerd Font:style=Medium:size=20;3";
        font-2 = "JetBrainsMono Nerd Font:size=9;3";
        font-3 = "outerNix:style=Regular:size=15;3";
        font-4 = "Font Awesome 6 Free,Font Awesome 6 Free Solid:style=Solid:size=10;3";
        font-5 = "Iosevka Nerd Font:style=Bold:size=12;3";
        font-6 = "VictorMono Nerd Font Mono,VictorMono NFM:style=Bold:size=11;3";
        font-7 = "Iosevka Nerd Font Mono,Iosevka NFM:style=Regular:size=12;3";
        font-8 = "outerNix:style=Regular:size=10;3";
        #font-1 = "waffle:size=10;3";
        #font-2 = "Iosevka Nerd Font:style=Medium:size=22;5";

        modules-left = "left-side sepg workspaces sepd";
        modules-center = "date";
        modules-right = "filesystem sepg cpu sep temperature sepd groupe-sep sepg light sep pulseaudio-tail sep battery sepd groupe-sep sepg network sepd powermenu";

        separator = "";

        dim-value = "1.0";

        wm-name = "i3";

        locale = "";

        tray-position = "none";
        tray-offset-x = -20;

        enable-ipc = true;
    };

    "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;

        screenchange-reload = false;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = false;
    };

    "module/workspaces" = modules.workspaces;
    "module/powermenu" = modules.powermenu;
    "module/pulseaudio-tail" = modules.pulseaudio-tail;
    "module/battery" = modules.battery;
    "module/date" = modules.date;
    "module/light" = modules.light;
    "module/network" = modules.network;
    "module/cpu" = modules.cpu;
    "module/title" = modules.title;
    "module/temperature" = modules.temperature;
    "module/filesystem" = modules.filesystem;
    "module/sepg" = modules.sepg;
    "module/sepd" = modules.sepd;
    "module/sepg2" = modules.sepg2;
    "module/sepd2" = modules.sepd2;
    "module/sep" = modules.sep;
    "module/groupe-sep" = modules.groupe-sep;
    "module/left-side" = modules.left-side;
    "module/mpd" = modules.mpd;
  };
}

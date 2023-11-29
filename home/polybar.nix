{ pkgs, ...}:
{ enable = true;

  script = "polybar -q -r main &";

  config = let
    color = {
        # old
        # background = "#2A2B28";
        # foreground = "#FFFFFF";

        # test
        background = "#1d2021";
        foreground = "#ebdbb2";

        foreground-alt = "#8F8F8F";
        module-fg = "#FFFFFF";
        primary = "#43a047";
        secondary = "#751313";
        alternate = "#FFFFFF";

        white = "#FFFFFF";
        black = "#000000";
        red = "#EC7875";
        pink = "#EC407A";
        purple = "#BA68C8";
        blue = "#42A5F5";
        cyan = "#4DD0E1";
        teal = "#00B19F";
        green = "#61C766";
        lime = "#B9C244";
        yellow = "#FDD835";
        amber = "#FBC02D";
        orange = "#E57C46";
        brown = "#AC8476";
        indigo = "#6C77BB";
        gray = "#9E9E9E";
        blue-gray = "#6D8895";
        light-green = "#7EB36B";

        # Color Outer Wilds
        o_black = "#0b1e26";
        o_purple = "#6a4d75";
        o_blue = "#174e7d";
        o_green = "#676e4c";
        o_orange = "#ff7d25";
    };
  in {
    "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
    };

    "bar/main" = {
        monitor-strict = false;

        override-redirect = false;

        fixed-center = true;

        width = "100%";
        height = 30;

        offset-x = "1%";
        # offset-y = "2%:-2";

        background = color.background;
        foreground = color.foreground;

        line-size = 2;
        line-color = color.primary;

        # border-bottom-size = 2;
        # border-bottom-color = color.primary;
        border-bottom-size = 0;

        padding = 1;
        module-margin = 2;

        font-1 = "JetBrainsMono Nerd Font:size=10;3";
        font-0 = "icomoon-feather:size=10;3";
        #font-0 = "Terminus:size=10;3";
        #font-1 = "waffle:size=10;3";
        #font-2 = "Iosevka Nerd Font:style=Medium:size=22;5";

        modules-left = "workspaces temperature cpu memory";
        modules-center = "";
        modules-right = "filesystem backlight battery network time";

        separator = "";

        dim-value = "1.0";

        wm-name = "i3";

        locale = "";

        tray-position = "right";
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

    "module/temperature" = {
        type = "internal/temperature";

        interval = "0.5";

        thermal-zone = 0;

        hwmon-path = "/sys/devices/pci0000:00/0000:00:1c.0/0000:39:00.0/nvme/nvme0/hwmon0/temp2_input";

        warn-temperature = 65;

        units = true;

        format = "<ramp> <label>";

        format-warn = "<ramp> <label-warn>";

        label = "%temperature-c%";

        label-warn = "%temperature-c%";

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        format-foreground = color.red;
    };

    "module/backlight" = {
        type = "internal/backlight";

        card = "intel_backlight";

        format = "<ramp> <label>";

        label = "%percentage%%";
        format-foreground = color.yellow;

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
    };

    "module/workspaces" = {
        type = "internal/xworkspaces";

        pin-workspaces = true;
        enable-click = true;
        enable-scroll = false;

        icon-0 = "1;1";
        icon-1 = "2;2";
        icon-2 = "3;3";
        icon-3 = "4;4";
        icon-4 = "5;5";
        icon-5 = "6;6";
        icon-6 = "7;7";
        icon-7 = "8;8";
        icon-8 = "9;9";

        format = "<label-state>";
        format-padding = 0;

        label-monitor = "%name%";

        label-active = "%name%";
        label-active-foreground = color.primary;
        label-active-overline = color.primary;

        label-occupied = "%name%";
        label-occupied-foreground = color.alternate;

        label-urgent = "%name%";
        label-urgent-foreground = color.secondary;

        label-empty = "%name%";

        label-active-padding = 2;
        label-urgent-padding = 2;
        label-occupied-padding = 2;
        label-empty-padding = 2;
    };

    "module/cpu" = {
        type = "internal/cpu";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-foreground = color.yellow;

        label = " %percentage%%";
    };

    "module/memory" = {
        type = "internal/memory";

        interval = 1;

        format = "<label>";
        format-prefix = "";
        format-foreground = color.blue;

        label = " %gb_used%";
    };

    "module/filesystem" = {
        type = "internal/fs";

        mount-0 = "/";

        interval = 30;

        fixed-values = true;

        format-mounted = "<label-mounted>";
        format-mounted-prefix = "";
        format-mounted-foreground = color.blue-gray;

        label-mounted = " %free%";
    };

    "module/battery" = {
        type = "internal/battery";

        full-at = 82;
        low-at = 20;

        battery = "BAT0";
        adapter = "AC";

        poll-interval = 5;

        time-format = "%H:%M";

        label-charging = "%percentage%%";
        format-charging = "<animation-charging> <label-charging>";
        format-charging-foreground = color.white;


        label-discharging = "%percentage%%";
        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-foreground = color.orange;

        label-low = " %percentage%%";
        format-low = "<label-low>";
        format-low-foreground = color.red;

        label-full = "Full";
        format-full = "<label-full>";
        format-full-prefix = " ";
        format-full-foreground = color.white;

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";

        animation-charging-framerate = 750;
    };

    "module/network" = {
        type = "internal/network";
        interface = "wlp0s20f3";

        interval = "3.0";

        accumulate-stats = true;

        unknown-as-up = true;

        format-connected = "<ramp-signal> <label-connected>";
        format-connected-foreground = color.gray;

        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "";
        format-disconnected-foreground = color.gray;

        label-connected = "%{A1:networkmanager_dmenu &:}%essid%%{A}";

        label-disconnected = "%{A1:networkmanager_dmenu &:} Offline%{A}";

        ramp-signal-0 = "";
        ramp-signal-1 = "";
        ramp-signal-2 = "";
    };

    "module/time" = {
        type = "internal/date";

        interval = "1.0";

        time = " %H:%M %D";

        format = "<label>";
        format-foreground = color.light-green;

        label = "%time%";
    };
  };
}

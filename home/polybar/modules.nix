let 
  color = import ./color.nix;
  background1 = color.gunmetal; #color.ultra_violet;
  background = color.background;
  polypath = "~/.config/home-manager/home/polybar";
in
{
  workspaces = {

      type = "internal/xworkspaces";

      initial-index = 0;
      pin-workspaces = false;
      enable-click = true;
      enable-scroll = false;

      icon-0 = "1;%{F#FFD400}%{o#FFD400}%{T9}%{T-}  1"; #Sun
      icon-1 = "2;%{F#FF9F00}%{o#FF9F00}%{T9}%{T-} 2";  #Sun Station
      icon-2 = "3;%{F#FE5100}%{o#FE5100}%{T9}%{T-} %{F#855A41}%{o#855A41} 3";  #Hourglasses twins
      icon-3 = "4;%{F#64854C}%{o#64854C}%{T9}%{T-}  4";  #Timber Hearth
      icon-4 = "5;%{F#616D98}%{o#616D98}%{T9}%{T-}  5"; #Brittle Hollow 
      icon-5 = "6;%{F#6DA05E}%{o#6DA05E}%{T9}%{T-}  6"; #Giant's deep
      icon-6 = "7;%{F#675C38}%{o#675C38}%{T9}%{T-}  7"; #Dark Bramble
      icon-7 = "8;%{F#DEE7E9}%{o#DEE7E9}%{T9}%{T-}  8"; #White Hole Station
      icon-8 = "9;%{F#7EF5F6}%{o#7EF5F6}%{T9}%{T-}  9"; #The Wanderer
      icon-9 = "10;%{F#677890}%{o#677890}%{T9}%{T-}10"; #Quantum moon

      format = "<label-state>";
      format-padding = 0;

      label-monitor = "%name%";

      label-active = "%icon%";
      #label-active = "%name%";
      #label-active-foreground = color.mauve;
      label-active-overline = "#00FFD400";
      #label-occupied-overline = "#00FFD400";

      label-occupied = "%icon%";
      label-occupied-foreground = color.alternate;
      label-occupied-background = background1;

      label-urgent = "%icon%";
      #label-urgent = "%name%";
      label-urgent-foreground = color.secondary;

      label-empty = "%icon%";
      #label-empty = "%name%";

      label-active-background = background1;
      label-empty-background = background1;
      label-urgent-background = background1;
      label-active-padding = 1;
      label-urgent-padding = 1;
      label-occupied-padding = 1;
      label-empty-padding = 1;
  };

  powermenu = {
      type = "custom/text";
      content = "   ";
      content-foreground = color.cerulean;
      content-background = color.background;
      click-left = polypath +"/powermenu.sh &";
    };

  pulseaudio-tail = {
      type = "custom/script";
      exec = polypath +"/pulseaudio-tail.sh";
      tail = true;
      click-right = "exec pavucontrol &";
      click-left = polypath +"/pulseaudio-tail.sh --mute &";
      scroll-up = polypath +"/pulseaudio-tail.sh --up &";
      scroll-down = polypath +"/pulseaudio-tail.sh --down &";
  };

  battery = {
      type = "custom/script";
      exec = polypath + "/battery.sh";
      interval = "10";
    };

  date = {
      type = "internal/date";

      interval = 1;
      format = "<label>";

      format-prefix = "%{T8} ";

      format-background = color.background;
      format-foreground = color.gold;


      time = "%H:%M %p";
      date = "%a, %d %b %Y";
      label = "%{T-}%date% 🭳 %time%";

  };
  
  light = {
      type = "custom/script";
      exec = polypath + "/light.sh";
      content-background = background1;
      interval = "0.1";
  };

  network = {
      type = "custom/script";
      exec = polypath + "/network.sh";
      tail = true;
  };

  cpu = {
      type = "internal/cpu";

      interval = 1;

      format = "<label>";
      format-prefix = "%{T5} ";
      format-prefix-font = 6;
      format-prefix-foreground = color.tangerine;
      format-prefix-background = background1;
      format-padding = 0;

      label = " CPU %percentage:02%%";
      label-foreground = color.tangerine;
      label-background = background1;

      content-foreground = background1;
    };

  title = {
      type = "internal/xwindow";

      format = "<label>";
      format-prefix = "  ";
      #format-prefix-font = 8;
      format-background = color.background;
      format-foreground = color.foreground;
      format-prefix-foreground = color.indigo;
      format-padding = 0;

      label = " %title%";
      label-maxlen = 20;

      label-empty = " Desktop";
      label-empty-foreground = color.foreground;
      label-empty-background = color.background;
    };

  
  temperature = {
      type = "internal/temperature";

      interval = "0.5";

      thermal-zone = 0;

      warn-temperature = 85;

      units = true;

      format = "<ramp><label>";
      format-foreground = color.foreground;
      format-background = background1;

      content-foreground = color.foreground;

      format-warn = "<ramp><label-warn>";
      format-warn-background = background1;
      format-warn-foreground = color.o_orange;

      label = " %temperature-c% ";
      label-foreground = color.cerulean;
      label-background = background1;

      label-warn = " %temperature-c%";
      label-warn-foreground = color.o_orange;
      label-warn-background = background1;

      ramp-0 = "";
      ramp-0-foreground = color.cerulean;
      ramp-1 = "";
      ramp-1-foreground = color.cerulean;
      ramp-2 = "";
      ramp-2-foreground = color.cerulean;
      ramp-3 = "";
      ramp-3-foreground = color.cerulean;
      ramp-4 = "";
      ramp-4-foreground = color.o_orange;
      ramp-font = 7;
      ramp-background = background1;
    };
  
  filesystem = {
      type = "internal/fs";

      mount-0 = "/";
      #mount-1 = /home
      #mount-2 = /var

      interval = 30;

      fixed-values = true;

      format-mounted = "<label-mounted>";
      format-mounted-prefix = "%{T6}󰅏 "; 
      format-mounted-background = color.background;
      format-mounted-foreground = color.flame;
      format-mounted-padding = 2;

      format-unmounted = "<label-unmounted>";
      format-unmounted-prefix = "%{T6}󰅤 ";
      format-unmounted-foreground = color.red;
      format-unmounted-background = color.background;
      format-unmounted-padding = 2;

      label-mounted = "%{T-}%free%";

      label-unmounted = "%{T-}%mountpoint%: not mounted";
    };

    mpd = {
        type = "internal/mpd";

        interval = 2;

        format-online = "<label-song><icon-prev><toggle><icon-next>";
        format-online-prefix = " ";
        format-online-prefix-font = 3;
        format-online-prefix-foreground = color.red;
        format-online-prefix-background = background1;
        format-online-foreground = color.foreground;

        format-playing ="<label-song><icon-prev><toggle><icon-next>"; 
        format-paused = "<label-song><icon-prev><toggle><icon-next>"; 
        format-stopped = "<label-song><icon-prev><toggle><icon-next>"; 

        format-offline = "<label-offline>";
        format-offline-prefix = "";
        format-offline-prefix-font = 3;
        format-offline-prefix-foreground = color.gray;
        format-offline-prefix-background = background1;
        format-offline-foreground = background1;

        label-song =  "%title%  ";
        label-song-foreground = color.foreground;
        label-song-background = background1;
        label-song-maxlen = 16;
        label-song-ellipsis = true;

        label-offline = " Offline";
        label-offline-foreground = color.foreground;
        label-offline-background = background1;
        label-offline-font = 1;

        icon-play = "";
        icon-play-foreground = color.purple;
        icon-play-background = background1;
        icon-pause = "";
        icon-pause-foreground = color.purple;
        icon-pause-background = background1; 
        icon-stop = "栗";
        icon-stop-foreground = color.yellow;
        icon-stop-background = background1;
        icon-prev = "";
        icon-prev-foreground = color.gray;
        icon-prev-background = background1;
        icon-next = " ";
        icon-next-foreground = color.gray;
        icon-next-background = background1;

        toggle-on-foreground = color.foreground;
        toggle-off-foreground = background1; 
    };


  sepg = {
      type = "custom/text";
      content = " %{T7}";

      content-foreground = background1;
      content-background = background;
  };

  sepd = {
      type = "custom/text";
      content = "%{T7}";
      content-foreground = background1;
      content-background = background;
  };

  sepg2 = {
      type = "custom/text";
      content = "%{T7}   ";

      content-foreground = color.fern_green;
      content-background = background;
  };

  sepd2 = {
      type = "custom/text";
      content = "%{T7}";
      content-foreground = background1;
      content-background = background;
  };

  sep = {
    type = "custom/text";
    content = " 🭳 ";
    content-background = background1;
    content-foreground = color.deft-blue;
  };

  groupe-sep = {
    type = "custom/text";
    content = " %{T8}⬢ ";
    content-background = background;
    content-foreground = color.deft-blue;
  };

  left-side = {
    type = "custom/text";
    content = "     ";
    content-background = background;
    content-foreground = color.cerulean;
  };

}

{ pkgs, ... }:
{
    enable = true;

    theme = builtins.toString (pkgs.writeText "rofi-theme" ''

    configuration{
        modi: "run,drun,window";
        icon-theme: "Oranchelo";
        show-icons: true;
        terminal: "alacritty";
        drun-display-format: "{icon} {name}";
        location: 0;
        disable-history: false;
        hide-scrollbar: true;
        display-drun: "     Apps ";
        display-run: "    Run ";
        display-window: "   Window ";
        sidebar-mode: true;


        kb-row-up: "Up,Control+k,Shift+Tab,Shift+ISO_Left_Tab";
        kb-row-left: "Control+h,Left";
        kb-row-right: "Control+l,Right";
        kb-row-down: "Down,Control+j";
        kb-accept-entry: "Control+m,Return,KP_Enter";
        kb-remove-to-eol: "Control+Shift+e";
        kb-mode-next: "Control+Page_Down";
        kb-mode-previous: "Control+Page_Up";
        kb-remove-char-back: "BackSpace";
        kb-mode-complete: "Control+c";
        kb-move-word-back: "Alt+b";
        kb-move-char-back: "Control+b";
        kb-move-char-forward: "Control+f";
    }

    @theme "/home/xutupax/.config/home-manager/home/rofi/catppuccin-mocha.rasi"
    ''
    );
}

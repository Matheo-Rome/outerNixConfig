{ pkgs, ...}:
{
  enable = true;

  settings = {
    window.opacity = 0.8;

    font = {
      size = 9;
      normal = {
        family = "JetBrainsMono";
        style = "Regular";
      };
      bold = {
        family = "JetBrainsMono";
        style = "Bold";
      };
      italic = {
        family = "JetBrainsMono";
        style = "italic";
      };

    };

    cursor.style = "Beam";
  
  
    colors = {
      # Default colors
      primary = {
        background = "0x1c0124";
        foreground = "0xf8f8f2";
      };

      # Normal colors
      normal = {
        black = "0x100e23";
        blue = "0x91ddff";
        cyan = "0xaaffe4";
        green = "0x95ffa4";
        magenta = "0xc991e1";
        red = "0xff8080";
        white = "0xcbe3e7";
        yellow = "0xffe9aa";
      };

      # Bright colors
      bright = {
        black = "0x565575";
        blue = "0x65b2ff";
        cyan = "0x63f2f1";
        green = "0x62d196";
        magenta = "0x906cff";
        red = "0xff5458";
        white = "0xa6b3cc";
        yellow = "0xffb378";
      };
    };
  };
} 

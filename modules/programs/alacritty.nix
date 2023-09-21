{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    colors = with config.colorScheme.colors; {
      bright = {
        black = "0x${base03}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base07}";
        yellow = "0x${base0A}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base05}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base05}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base05}";
      };
    };
    font = {
      normal = {
        family = "MonoLisa";
        style = "Regular";
      };
      bold = {
        family = "MonoLisa";
        style = "Bold";
      };
      italic = {
        family = "MonoLisa";
        style = "Italic";
      };
      bold_italic = {
        family = "MonoLisa";
        style = "Bold Italic";
      };
      size = 12;
      #bold_italic = {};
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      kitty
    ];
  };

  home.file = {
    ".config/kitty/kitty.conf" = {
      text = ''
        include ./theme.conf
        font_family     SauceCodePro Nerd Font
        font_size 14.0

        background_opacity 1.0

        show_hyperlink_targets yes

        allow_hyperlinks yes

        #term xterm-kitty
        term xterm-256color

        confirm_os_window_close 0
      '';
    };
  };

  home.file = {
    ".config/kitty/theme.conf" = {
      text = ''

        # Kitty window border colors
        active_border_color     #${config.colorScheme.colors.base07}
        inactive_border_color   #${config.colorScheme.colors.base02}
        bell_border_color       #${config.colorScheme.colors.base0A}

        # URL underline color when hovering with mouse
        url_color               #${config.colorScheme.colors.base06}

        # Colors for marks (marked text in the terminal)
        mark1_foreground #${config.colorScheme.colors.base00}
        mark1_background #${config.colorScheme.colors.base07}
        mark2_foreground #${config.colorScheme.colors.base00}
        mark2_background #${config.colorScheme.colors.base0E}
        mark3_foreground #${config.colorScheme.colors.base00}
        mark3_background #${config.colorScheme.colors.base0D}

        background #${config.colorScheme.colors.base00}
        foreground #${config.colorScheme.colors.base05}
        cursor #${config.colorScheme.colors.base06}
        cursor_text_color #${config.colorScheme.colors.base00}
        color0 #${config.colorScheme.colors.base03}
        color1 #${config.colorScheme.colors.base08}
        color2 #${config.colorScheme.colors.base0B}
        color3 #${config.colorScheme.colors.base0A}
        color4 #${config.colorScheme.colors.base0D}
        color5 #${config.colorScheme.colors.base0F}
        color6 #${config.colorScheme.colors.base0C}
        color7 #${config.colorScheme.colors.base03}
        color8 #${config.colorScheme.colors.base04}
        color9 #${config.colorScheme.colors.base08}
        color10 #${config.colorScheme.colors.base0B}
        color11 #${config.colorScheme.colors.base0A}
        color12 #${config.colorScheme.colors.base0D}
        color13 #${config.colorScheme.colors.base0F}
        color14 #${config.colorScheme.colors.base0C}
        color15 #${config.colorScheme.colors.base04}
        selection_foreground #${config.colorScheme.colors.base00}
        selection_background #${config.colorScheme.colors.base06}
      '';
    };
  };
}

{ pkgs, ... }:
{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-sulphurpool-light.yaml";
    #    image = ./wallpaper.jpg;
    image = ../../wallpapers/nixos-wallpaper-catppuccin-latte.png;
    #polarity = "dark";
    autoEnable = true;
    enable = true;

    opacity.terminal = 1.0;
    fonts.sizes.terminal = 18;

    fonts = {
      serif = {
        package = pkgs.lmodern;
        name = "Latin Modern Roman";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      monospace = {
        package = pkgs.fira-code;
        name = "Fire Code";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}

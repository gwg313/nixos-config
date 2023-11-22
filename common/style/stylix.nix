{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-storm.yaml";
    image = ./wallpaper.jpg;
    autoEnable = true;

    opacity.terminal = 1.0;
    fonts.sizes.terminal = 15;

    fonts = {
      serif = {
        package = pkgs.meslo-lgs-nf;
        name = "MesloLGS NF";
      };

      sansSerif = {
        package = pkgs.meslo-lgs-nf;
        name = "MesloLGS NF";
      };

      monospace = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Mono";
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

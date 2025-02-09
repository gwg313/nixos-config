{
  pkgs,
  lib,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto-update = "off";
      # background-opacity = 0.8;
      background-opacity = 1;
      confirm-close-surface = false;
      font-family = lib.mkForce "Comic Code Ligatures";
      font-size = 16;
      gtk-titlebar = false;
      # theme = "Teerb";
    };

  };
  home.packages = with pkgs; [
    ueberzugpp
  ];
}

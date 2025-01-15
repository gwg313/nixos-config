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
      background-opacity = 0.8;
      confirm-close-surface = false;
      font-family = "Comic Code Ligatures";
      font-size = 14;
      # theme = "Teerb";
    };

  };
  home.packages = with pkgs; [
    ueberzugpp
  ];
}

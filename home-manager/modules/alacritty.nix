# A fast, GPU-accelerated terminal emulator.
{
  pkgs,
  lib,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal = {
          family = lib.mkForce "Monaspace Krypton";
        };
      };
    };
  };
  home.packages = with pkgs; [
    ueberzugpp
    monaspace
  ];
}

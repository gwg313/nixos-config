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
          # family = lib.mkForce "Monaspace Krypton";
          family = lib.mkForce "Comic Code";
        };
      };
    };
  };
  home.packages = with pkgs; [
    ueberzugpp
    monaspace
  ];
}

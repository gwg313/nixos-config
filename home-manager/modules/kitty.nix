# A fast, GPU-accelerated terminal emulator.
{
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font = {
      # name = lib.mkForce "Comic Code";
      size = lib.mkForce 16;
    };
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
            font_family      family="Comic Code Ligatures"
            bold_font        auto
            italic_font      auto
            bold_italic_font auto
      symbol_map U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+ed00-U+efc1,U+f000-U+f2ff,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
    '';
    environment = {
      "TERM" = "xterm-256color";
    };
  };
  home.packages = with pkgs; [
    ueberzugpp
  ];
}

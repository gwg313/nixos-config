# A fast, GPU-accelerated terminal emulator.
{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
    };
  };
  home.packages = with pkgs; [ueberzugpp];
}

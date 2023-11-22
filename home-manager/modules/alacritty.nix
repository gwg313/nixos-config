# A fast, GPU-accelerated terminal emulator.
{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {TERM = "xterm-256color";};
    };
  };
}

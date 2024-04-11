# A modern replacement for 'ls'.
{...}: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = true;
  };
}

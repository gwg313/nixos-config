# A modern replacement for 'ls'.
{...}: {
  programs.eza = {
    enable = true;
    enableAliases = true;
    git = true;
    icons = true;
  };
}

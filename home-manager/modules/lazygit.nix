# A terminal-based Git interface.
{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git.overrideGpg = true;
    };
  };
}

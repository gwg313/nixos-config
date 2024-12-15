# ✨ Magical shell history
{ ... }:
{
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.zsh = {
    shellAliases = {
      cd = "z";
    };
  };
}

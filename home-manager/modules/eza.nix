# A modern replacement for 'ls'.
{ ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--git-ignore"
      "--icons=always"
    ];
  };
}

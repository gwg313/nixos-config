{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      # Open document in fit-width mode by default
      set adjust-open "best-fit"
    '';
  };
}

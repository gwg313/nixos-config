{ config, lib, pkgs, user, ... }: {

  programs.git = {
    enable = true;
    userName = "Glen Goodwin";
    userEmail = "glen.goodwin1992@gmail.com";
    extraConfig = {
      merge = {
        ff = "only";
      };
    };
  };

  programs.zsh = {
    shellAliases = {

      trackme = "git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)";
      rebasemain = "git pull origin main --rebase";

    };
  };

  home.packages = with pkgs; [
    cocogitto
    lazygit
    gh
    pre-commit
  ];
}

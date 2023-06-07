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

  home.packages = with pkgs; [
    cocogitto
    lazygit
    gh
    pre-commit
  ];
}

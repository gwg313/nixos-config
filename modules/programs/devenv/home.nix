{ config, lib, pkgs, user, devenv, ... }: {

  home.packages = with pkgs; [
    cachix
    devenv.packages.${system}.devenv
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.zsh.enable = true;

}

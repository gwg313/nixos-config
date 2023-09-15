{ config, lib, pkgs, user, devenv, inputs, ... }: {

  home.packages = with pkgs; [
    cachix
    inputs.devenv.packages.${system}.devenv
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.zsh.enable = true;

}

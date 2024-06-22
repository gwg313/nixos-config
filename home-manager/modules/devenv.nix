{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    cachix
    # inputs.devenv.packages.${system}.devenv
    devenv
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}

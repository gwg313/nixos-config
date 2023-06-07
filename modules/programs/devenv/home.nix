{ config, lib, pkgs, user, devenv, ... }: {

home.packages = with pkgs; [
cachix
devenv.packages.${system}.devenv
];

}

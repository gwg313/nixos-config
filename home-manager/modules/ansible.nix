{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ansible
    ansible-later
    ansible-doctor
  ];
}

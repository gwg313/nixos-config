{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  # Define a user account. Don't forget to set a password with 'passwd'.
  programs.zsh.enable = true;
  users.users.gwg313 = {
    isNormalUser = true;
    description = "Glen Goodwin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "docker"
      "audio"
      "wireshark"
    ];
    shell = pkgs.zsh;
    uid = 1000;
  };
}

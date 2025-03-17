# A cat clone with syntax highlighting and Git integration.
{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;

    # additional packages to add to gjs's runtime
    # extraPackages = with pkgs; [
    #   gtksourceview
    #   webkitgtk
    #   accountsservice
    #   libdbusmenu-gtk3
    # ];
  };
}

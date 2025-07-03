# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:

    ./grymforge/variables.nix
    # ../modules/hyprpanel.nix
    # ../modules/hyprlock.nix
    # ../modules/hypridle.nix
    # ./nvim.nix
    ../modules/nvf
    ../modules/common.nix
    ../modules/hyprland
    # ../modules/hyprland.nix
    ../modules/common-gui.nix
    ../modules/linux-gui.nix
    ../modules/devenv.nix
    ../modules/gh-dash.nix
    ../modules/ssh.nix
    # ../modules/neovim/default.nix
    ../modules/yazi.nix
    ../modules/qutebrowser.nix
    ../scripts/default.nix
    ../../common/style/vars/vars.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      # (final: prev: {
      #   neovim = inputs.neovim-config.packages."x86_64-linux".default;
      # })

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "gwg313";
    homeDirectory = "/home/gwg313";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-Light";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
      };
    };
    # font.name = "Inter 13";
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita";
  };
  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ openvpn ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

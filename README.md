# NixOS Flake Configuration

## Overview

This repository contains my NixOS configuration as a flake. This configuration is designed to provide a reproducible and declarative setup for my system. It includes system configuration, package management, and various other NixOS features.

### Window Manager
 - hyrpland
 - waybar
 - swaylock
 - wofi
 - light
 - grimshot
 - mako 

### Terminal
 - alacritty
 - zsh
 - starship
 - tmux
 - neovim(my configuration can be found [here](https://github.com/gwg313/nvim-nix))
 - eza
 - ripgrep
 - fd
## Prerequisites

Before using this NixOS flake configuration, you should have the following prerequisites:

 - NixOs should be installed on your system.
 - Familiarity with Nix and NixOS concepts is helpful but not required.

## Usage

This section should provide guidance on using and managing your NixOS configuration.

To rebuild and switch to the new configuration:

```bash
nixos-rebuild switch --flake .#thinkpad
```


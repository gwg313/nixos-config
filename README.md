# NixOS Flake Configuration

## Overview

This repository contains my NixOS configuration as a flake. This configuration
is designed to provide a reproducible and declarative setup for my system. It
includes system configuration, package management, and various other NixOS
features.

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
- neovim(my configuration can be found
  [here](https://github.com/gwg313/nvim-nix))
- eza
- ripgrep
- fd

## Prerequisites

Before using this NixOS flake configuration, you should have the following
prerequisites:

- NixOs should be installed on your system.
- Familiarity with Nix and NixOS concepts is helpful but not required.

## Usage

NixOS and home-manager are called seperately,

To rebuild and switch to the new NixOS configuration:

```bash
nixos-rebuild switch --flake .#candlekeep
```

To rebuild and switch to the new home-manager configuration:

```bash
home-manager switch --flake .#gwg313@candlekeep
```

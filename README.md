# ❄️ NixOS Configurations

This repository contains my declarative and fully reproducible system
configurations using [Nix flakes](https://nixos.wiki/wiki/Flakes). It manages
multiple machines—including laptops, desktops, and servers—using both NixOS and
[Home Manager](https://nix-community.github.io/home-manager/).

## 🧱 Structure

This flake manages:

- 🖥️ **Desktop** (NixOS + Home Manager)
- 💻 **Laptop** (NixOS + Home Manager)
- 🗄️ **Servers** (headless NixOS deployments)
- 👤 User environments (via Home Manager, on both NixOS and non-NixOS systems)

### Key Directories

- `hosts/` – Per-machine NixOS configurations (e.g., `candlekeep.nix`,
  `grymforge.nix`)
- `home-manager/` – User-specific Home Manager modules and machines etc.)
- `flake.nix` / `flake.lock` – Flake definition and dependency pinning

## 🚀 Getting Started

### Requirements

- `nix` with flakes enabled
- Optional: [home-manager](https://github.com/nix-community/home-manager) and
  [direnv](https://direnv.net/)

### Bootstrap a New Machine

```bash
nix run github:yourusername/nixos-configurations#your-hostname
```

Or, if you're already inside the repo:

```bash
sudo nixos-rebuild switch --flake .#your-hostname
```

### Update All Machines

```bash
nix flake update
git commit -am "flake: update"
```

You can also run automated rebuilds and deployments using tools like:

- [`colmena`](https://github.com/zhaofengli/colmena)
- [`deploy-rs`](https://github.com/serokell/deploy-rs)
- [`nixos-rebuild --target-host`](https://nixos.org/manual/nixos/stable/#sec-deploying-to-a-remote-machine)

## 🔐 Secrets

Secrets are managed via:

- [sops-nix](https://github.com/Mic92/sops-nix)
- Encrypted with age
- Stored in `.sops.yaml` and `secrets/` directory

## 💡 Features

- Flake-based multi-machine setup
- Home Manager integrated per-user config
- Declarative hardware profiles
- Secure secret management with sops-nix
- Support for remote servers and local workstations.

## 📝 Hosts

| Hostname     | Role                 | Description                     |
| ------------ | -------------------- | ------------------------------- |
| `candlekeep` | Laptop               | Hyprland, Kitty, Zsh, Neovim    |
| `grymforge`  | Main Workstation     | Hyprland, Kitty, Zsh, Neovim    |
| `seikan`     | Reverse Proxy Server | Cloud Server, Traefik, Zerotier |
| `waypoint`   | Reverse Proxy Server | Traefik, Zerotier               |
| `panopticon` | Log Server           | Loki, Promtail, Grafana         |
| `vault-tec`  | Nix Cache Server     | Attic                           |

## 🔄 Workflow

1. Edit your configs (in `hosts/`, `home/`, or `modules/`)
2. Rebuild locally or deploy remotely
3. Commit and push to Git
4. (Optional) CI/CD runs remote rebuilds

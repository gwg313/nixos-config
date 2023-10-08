{ config, lib, pkgs, stable, user, devenv, inputs, ... }:

{
  imports = # Home Manager Modules
    [ (import ../modules/shell/git/home.nix) ] ++
    [ (import ../modules/programs/wofi.nix) ] ++
    [ (import ../modules/editors/nvim/home.nix) ] ++
    [ (import ../modules/programs/devenv/home.nix) ] ++
    [ (import ../modules/programs/kitty.nix) ] ++
    [ (import ../modules/shell/tmux/home.nix) ] ++
    [ (import ../modules/shell/ranger/home.nix) ] ++
    [ (import ../modules/editors/lvim/home.nix) ] ++
    [ (import ../modules/themes/home.nix) ] ++
    [ (import ../modules/programs/mako.nix) ] ++
    [ (import ../modules/programs/alacritty.nix) ] ++
    [ (import ../modules/desktop/gtk.nix) ] ++
    [ (import ../modules/shell/zsh/home.nix) ];


  #Add support for ./local/bin
  #home.sessionPath = [
  #"$HOME/.local/bin"
  #];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      devbox
      nix-prefetch-git
      libnotify
      kubernetes-helm
      argocd
      k3d
      element-desktop
      nix-init

      tor-browser-bundle-bin
      nmap
      dig
      signal-desktop
      minikube
      kubectl
      viddy

      # Terminal
      htop
      nitch # Minimal fetch
      tldr # Helper
      zellij # multiplexer
      dog # dns tool
      eza # better ls
      bat # better cap
      sd # simpler sed
      fd # simpler find
      xh
      ncdu
      duf
      atuin
      ranger
      thefuck
      hyperfine
      procs
      ripgrep
      nerdfonts
      pfetch
      dbeaver
      ansible
      nixpkgs-fmt
      zoxide
      webcord
      nfs-utils
      keychain
      slides
      glow
      entr
      just
      bandwhich
      navi
      git-crypt



      # Video/Audio
      feh # Image Viewer
      #mpv               # Media Player
      pavucontrol # Audio Control
      #plex-media-player # Media Player
      vlc # Media Player
      stremio # Media Streamer

      # Apps
      appimage-run # Runs AppImages on NixOS
      firefox # Browser
      google-chrome # Browser
      remmina # XRDP & VNC Client
      anki
      obsidian

      # File Management
      gnome.file-roller # Archive Manager
      okular # PDF Viewer
      #pcmanfm           # File Manager
      p7zip # Zip Encryption
      rsync # Syncer - $ rsync -r dir1/ dir2/
      unzip # Zip Files
      unrar # Rar Files
      zip # Zip

      # General configuration
      #git              # Repositories
      #killall          # Stop Applications
      #nano             # Text Editor
      #pciutils         # Computer Utility Info
      #pipewire         # Sound
      #usbutils         # USB Utility Info
      #wacomtablet      # Wacom Tablet
      #wget             # Downloader
      #zsh              # Shell
      #
      # General home-manager
      #alacritty        # Terminal Emulator
      #dunst            # Notifications
      #doom emacs       # Text Editor
      #libnotify        # Dependency for Dunst
      #neovim           # Text Editor
      #rofi             # Menu
      #rofi-power-menu  # Power Menu
      #udiskie          # Auto Mounting
      #vim              # Text Editor
      #
      # Xorg configuration
      #xclip            # Console Clipboard
      #xorg.xev         # Input Viewer
      #xorg.xkill       # Kill Applications
      #xorg.xrandr      # Screen Settings
      #xterm            # Terminal
      #
      # Xorg home-manager
      #flameshot        # Screenshot
      #picom            # Compositer
      #sxhkd            # Shortcuts
      #
      # Wayland configuration
      #autotiling       # Tiling Script
      #grim             # Image Grabber
      #slurp            # Region Selector
      #swappy           # Screenshot Editor
      #swayidle         # Idle Management Daemon
      #wev              # Input Viewer
      #wl-clipboard     # Console Clipboard
      #wlr-randr        # Screen Settings
      #xwayland         # X for Wayland
      #
      # Wayland home-manager
      #mpvpaper         # Video Wallpaper
      #pamixer          # Pulse Audio Mixer
      swaybg # Background
      #swaylock-fancy   # Screen Locker
      #waybar           # Bar
      #
      # Desktop
      #ansible          # Automation
      #blueman          # Bluetooth
      #deluge           # Torrents
      discord # Chat
      #ffmpeg           # Video Support (dslr)
      #gmtp             # Mount MTP (GoPro)
      #gphoto2          # Digital Photography
      #handbrake        # Encoder
      #heroic           # Game Launcher
      #hugo             # Static Website Builder
      #lutris           # Game Launcher
      #mkvtoolnix       # Matroska Tool
      #plex-media-player# Media Player
      #prismlauncher    # MC Launcher
      #steam            # Games
      #simple-scan      # Scanning
      #sshpass          # Ansible dependency
      # 
      # Laptop
      #cbatticon        # Battery Notifications
      #blueman          # Bluetooth
      #light            # Display Brightness
      #libreoffice      # Office Tools
      #simple-scan      # Scanning
      #
      # Flatpak
      #obs-studio       # Recording/Live Streaming
    ];
    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };
}

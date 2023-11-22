{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./tmux/tmux.nix
    ./zsh.nix
    ./starship.nix
    ./atuin.nix
    ./bat.nix
    ./broot.nix
    ./eza.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      # Editors
      vim # Highly configurable text editor popular for efficiency and extensibility.
      neovim # Improved version of vim, often used with overlays.

      # Builtin Replacements
      htop # Modern and interactive process viewer, an improved alternative to 'top.'
      bottom # Similar to 'htop,' providing a top-like interface with additional features.
      colordiff # Tool to colorize 'diff' output, making differences between files easier to spot.
      du-dust # Modern replacement for 'du,' offering intuitive and visually appealing disk usage analysis.
      eza # Modern replacement for 'ls' with additional features and a user-friendly interface.
      fd # Faster and user-friendly alternative to 'find' for searching and locating files.
      ripgrep # Faster alternative to 'grep,' recursively searching directories for a regex pattern.
      thefuck # Handy tool that corrects mistyped console commands.
      zoxide # Faster alternative to 'cd' for quick and efficient navigation.
      fzf # Fuzzy finder for rapid file and directory searches.
      tealdeer # Command-line utility providing simplified and community-driven man pages.
      viddy # A modern watch command. Time machine and pager etc.
      moar # A syntax highlighting pager

      # Multiplexers
      tmate # Terminal multiplexer allowing multiple users to access a single session.

      # Misc Tools
      tree # Displays directory structure in a tree-like format.
      p7zip # Command-line tool for handling 7z compressed files.
      yt-dlp # Fork of youtube-dl, facilitating video downloads from various sites.
      mkvtoolnix # Set of tools to create, alter, and inspect Matroska files (MKV).
      hyperfine # Command-line benchmarking tool.
      unzip # Command-line tool for extracting files from ZIP archives.

      # TUI Apps
      #ncdu_2

      # Networking
      gping # Ping with TUI for a visual representation of network connectivity.
      iperf # Tool for measuring maximum TCP and UDP bandwidth performance.
      nmap # Network scanning tool for discovering hosts and services.
      wget # Command-line utility for downloading files from the web.
      speedtest-cli # Command-line interface for testing internet bandwidth.
      rsync # Fast and versatile file copying and synchronization tool.
      dig # A command-line tool for querying DNS name servers, providing detailed information about domain names, IP addresses, and DNS records.

      picocom # Minimal terminal emulator for microcontrollers.

      # Docs
      pandoc # Document converter transforming files between markup formats.
      gnumake # GNU make tool, a build automation tool for compiling projects.

      # Useful Utils
      grex # Tool generating regular expressions from user-provided test cases.
      git-cliff # Tool for visualizing project commit history and generating release notes.

      # Nix Tools
      nix-prefetch-github # Tool for fetching the latest version and hash of a GitHub repository.
      direnv # Environment switcher for the shell.
      nix-direnv # Integration of direnv with the Nix package manager.
      alejandra # Nix code formatter.
      nix-init # Simplifies the process of creating Nix projects.
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils # Essential GNU core utilities, including `dd` with the `--status=progress` option for more informative progress reporting.
      wifi-password # Command-line tool to quickly retrieve the current Wi-Fi password, simplifying access to network credentials.
      time # GNU time command, providing more detailed and accurate information about the resource usage of a command or process.
    ]
    ++ lib.optionals stdenv.isLinux [
      iputils # Package providing essential network utilities such as `ping` and `ifconfig` for network diagnostics and configuration.
      libuuid # Library for generating universally unique identifiers (UUIDs), with the `uuidgen` utility included. (Note: Already pre-installed on macOS.)
      iotop # Disk I/O monitoring tool that provides a top-like interface to showcase real-time disk activity and identify performance bottlenecks.
      iftop # Network monitoring tool that displays a real-time, interactive view of network bandwidth usage by different connections.
      bmon # Bandwidth monitoring tool that visually represents network usage with a simple and easy-to-read interface.
      bandwhich # Network bandwidth monitor that identifies and displays bandwidth usage per process, helping to pinpoint data-hungry applications.
    ];
}

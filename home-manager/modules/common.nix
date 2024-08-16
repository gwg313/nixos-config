{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./atuin.nix
    ./bat.nix
    ./broot.nix
    ./eza.nix
    ./git.nix
    ./pass.nix
    ./starship.nix
    ./tmux/tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      # Editors
      #     neovim # Improved version of vim, often used with overlays.
      vim # Highly configurable text editor popular for efficiency and extensibility.

      # Builtin Replacements
      bottom # Similar to 'htop,' providing a top-like interface with additional features.
      colordiff # Tool to colorize 'diff' output, making differences between files easier to spot.
      du-dust # Modern replacement for 'du,' offering intuitive and visually appealing disk usage analysis.
      duf # Disk Usage/Free utility with a user-friendly interface for visualizing disk space consumption and information.
      eza # Modern replacement for 'ls' with additional features and a user-friendly interface.
      fd # Faster and user-friendly alternative to 'find' for searching and locating files.
      fzf # Fuzzy finder for rapid file and directory searches.
      htop # Modern and interactive process viewer, an improved alternative to 'top.'
      moar # A syntax highlighting pager
      ripgrep # Faster alternative to 'grep,' recursively searching directories for a regex pattern.
      rm-improved # Enhanced file and directory removal tool with interactive prompts, advanced options, and improved user feedback.
      tealdeer # Command-line utility providing simplified and community-driven man pages.
      thefuck # Handy tool that corrects mistyped console commands.
      viddy # A modern watch command. Time machine and pager etc.

      # Multiplexers
      tmate # Terminal multiplexer allowing multiple users to access a single session.

      # Misc Tools
      hyperfine # Command-line benchmarking tool.
      mkvtoolnix # Set of tools to create, alter, and inspect Matroska files (MKV).
      p7zip # Command-line tool for handling 7z compressed files.
      rclone # Command-line program to manage files on cloud storage with support for a wide range of providers and advanced synchronization features.
      restic # Secure and efficient backup tool with deduplication, encryption, and flexible storage options.
      scc # Source code counter for various programming languages, providing code statistics and complexity analysis.
      tree # Displays directory structure in a tree-like format.
      unzip # Command-line tool for extracting files from ZIP archives.
      yt-dlp # Fork of youtube-dl, facilitating video downloads from various sites.
      age
      portal
      atac

      # TUI Apps
      #ncdu_2

      # Networking
      dig # A command-line tool for querying DNS name servers, providing detailed information about domain names, IP addresses, and DNS records.
      gping # Ping with TUI for a visual representation of network connectivity.
      iperf # Tool for measuring maximum TCP and UDP bandwidth performance.
      nmap # Network scanning tool for discovering hosts and services.
      rsync # Fast and versatile file copying and synchronization tool.
      speedtest-cli # Command-line interface for testing internet bandwidth.
      wget # Command-line utility for downloading files from the web.

      picocom # Minimal terminal emulator for microcontrollers.

      # Docs
      gnumake # GNU make tool, a build automation tool for compiling projects.
      pandoc # Document converter transforming files between markup formats.

      # Useful Utils
      buku # Powerful command-line bookmark manager, providing a flexible and efficient way to organize, search, and access your bookmarks securely.
      entr # Event notifier for automation and development, executing commands whenever files change in the specified directory.
      git-cliff # Tool for visualizing project commit history and generating release notes.
      grex # Tool generating regular expressions from user-provided test cases.
      sshs

      # Nix Tools
      alejandra # Nix code formatter.
      direnv # Environment switcher for the shell.
      nix-direnv # Integration of direnv with the Nix package manager.
      nix-init # Simplifies the process of creating Nix projects.
      nix-prefetch-github # Tool for fetching the latest version and hash of a GitHub repository.
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils # Essential GNU core utilities, including `dd` with the `--status=progress` option for more informative progress reporting.
      time # GNU time command, providing more detailed and accurate information about the resource usage of a command or process.
      wifi-password # Command-line tool to quickly retrieve the current Wi-Fi password, simplifying access to network credentials.
    ]
    ++ lib.optionals stdenv.isLinux [
      bandwhich # Network bandwidth monitor that identifies and displays bandwidth usage per process, helping to pinpoint data-hungry applications.
      bmon # Bandwidth monitoring tool that visually represents network usage with a simple and easy-to-read interface.
      iftop # Network monitoring tool that displays a real-time, interactive view of network bandwidth usage by different connections.
      iotop # Disk I/O monitoring tool that provides a top-like interface to showcase real-time disk activity and identify performance bottlenecks.
      iputils # Package providing essential network utilities such as `ping` and `ifconfig` for network diagnostics and configuration.
      libuuid # Library for generating universally unique identifiers (UUIDs), with the `uuidgen` utility included. (Note: Already pre-installed on macOS.)
    ];
}

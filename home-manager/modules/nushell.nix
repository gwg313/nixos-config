# A cat clone with syntax highlighting and Git integration.
{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    envFile.text = ''
      # Environment Variables
      $env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
      # Starship Prompt
      mkdir ~/.cache/starship
      starship init nu | save -f ~/.cache/starship/init.nu
      # Zoxide
      zoxide init nushell | save -f ~/.zoxide.nu
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      clean = "nix-collect-garbage -d";
      repair = "nix-store --repair --verify --check-contents";

      "." = "cd ../";
      ".." = "cd ../../";
      "..." = "cd ../../../";
      "...." = "cd ../../../../";

      ls = "ls | grid -c -i";
      ll = "ls";

      ps = "procs";
      grep = "rg";
      cat = "bat";
      vim = "nvim";

      # Default flags
      rm = "rm -i";
      chmod = "chmod -R";
      cp = "cp -i -v";
      mv = "mv -i -v";
      mkdir = "mkdir -p -v";
      df = "df -h";
      du = "du -h -s";
      dd = "dd status=progress bs=4M conv=fdatasync ";
      wgetpaste = "wgetpaste -Xx";
      sudo = "sudo "; # Makes sudo work with       es
      ssh = "TERM=xterm ssh"; # Fixes some issues with ssh on some terminals
      wget = "wget -c";
      ping = "ping -c 5";
      ftp = "ftp -p";

      # Misc alieses I use often

      ports = "ss -tulanp";
      rmd = "rm -rf";
      mine = "sudo chown -R $(whoami):users";
      benchmark = "hyperfine --warmup 3 ";
      c = "clear";
      listen = "lsof -P -i -n";
      octal = "stat -c '%a %n'";
    };
    configFile.text = ''
        $env.config = {
          show_banner: false
        }
        # Starhip Prompt
        use ~/.cache/starship/init.nu
        # Zoxide
        source ~/.zoxide.nu
        # nix shell
        def nix-shell [] {
          nix-shell --run $env.SHELL
        }
        def "version-completions" [] {
        [
          {value: "4", description: "IPv4 address (default)"},
          {value: "6", description: "IPv6 address"}
        ]}
        # Define the function with completion annotation
        def "whatismyip" [
          version?: int@version-completions # Parameter with custom completion
        ] {
          # Validate and set default version
          let version = if ($version == null) {
            4
          } else if ($version in [4 6]) {
            $version
          } else {
            error make {
            msg: "Invalid IP version. Must be either 4 or 6."
          }
        }
        # Get IP address
        let ip = (http get $"https://api($version).ipify.org")
        # Create record and display as table
        {
          $"ip($version)": $ip
        } | table
      }
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];

  programs = {
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
    # starship = {
    #   enable = true;
    #   settings = {
    #     add_newline = true;
    #     character = {
    #       success_symbol = "[➜](bold green)";
    #       error_symbol = "[➜](bold red)";
    #     };
    #   };
    # };
  };
}

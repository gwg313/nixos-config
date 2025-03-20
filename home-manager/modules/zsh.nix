{
  config,
  lib,
  pkgs,
  user,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      clean = "nix-collect-garbage -d";
      repair = "nix-store --repair --verify --check-contents";
      reload = "source ~/.zshrc";

      "." = "cd ../";
      ".." = "cd ../../";
      "..." = "cd ../../../";
      "...." = "cd ../../../../";

      ps = "procs";
      grep = "rg";
      cat = "bat";
      vim = "nvim";

      # Default flags
      rm = "rm -i";
      chmod = "chmod -R";
      cp = "cp -R -i -v";
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

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      eval $(thefuck --alias)
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}

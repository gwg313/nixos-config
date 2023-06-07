{ config, lib, pkgs, user, ... }: {

  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      reload = "source ~/.zshrc";

      "." = "cd ../";
      ".." = "cd ../../";
      "..." = "cd ../../../";
      "...." = "cd ../../../../";

      ls = "exa --icons";
      l = "exa -al --icons";
      la = "exa -a --color=always --group-directories-first --icons"; # all files and dirs
      ll = "exa -l --color=always --group-directories-first --icons"; # long format
      lt = "exa -aT --color=always --group-directories-first --icons"; # tree listing

      cat = "bat";
      ps = "procs";
      grep = "rg";

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

      # Misc alieses I use often

      ports = "netstat -tulanp";
      rmd = "rm -rf";
      mine = "sudo chown -R $(whoami):users";
      benchmark = "hyperfine --warmup 3 ";
      c = "clear";
      listen = "lsof -P -i -n";
      nc = "nordvpn connect sweden";
      nd = "nordvpn disconnect";
      tra = "transmission-remote -a";
      clock = "sudo ntpd -gq";
      octal = "stat -c '%a %n'";

    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "MichaelAquilina/zsh-you-should-use"; }
      ];
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      #clear
      #neofetch
       eval "$(atuin init zsh)"
    '';
  };

}

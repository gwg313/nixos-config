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
    syntaxHighlighting.highlighters = [
      "main"
      "brackets"
      "pattern"
      "regexp"
      "root"
      "line"
    ];
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
      cat = "bat --theme=base16 --color=always --paging=never --tabs=2 --wrap=never --plain";
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
      f = "$(pay-respects zsh)";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      eval "$(pay-respects zsh --alias)"

            # search history based on what's typed in the prompt
            autoload -U history-search-end
            zle -N history-beginning-search-backward-end history-search-end
            zle -N history-beginning-search-forward-end history-search-end
            bindkey "^[OA" history-beginning-search-backward-end
            bindkey "^[OB" history-beginning-search-forward-end


            # General completion behavior
            zstyle ':completion:*' completer _extensions _complete _approximate
            # Use cache
            zstyle ':completion:*' use-cache on
            zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"


            # Complete the alias
            zstyle ':completion:*' complete true
            # Autocomplete options
            zstyle ':completion:*' complete-options true


            # Completion matching control
            zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
            zstyle ':completion:*' keep-prefix true


            # Group matches and describe
            zstyle ':completion:*' menu select
            zstyle ':completion:*' list-grouped false
            zstyle ':completion:*' list-separator '''
            zstyle ':completion:*' group-name '''
            zstyle ':completion:*' verbose yes
            zstyle ':completion:*:matches' group 'yes'
            zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
            zstyle ':completion:*:messages' format '%d'
            zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
            zstyle ':completion:*:descriptions' format '[%d]'


            # Colors
            zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}


            # case insensitive tab completion
            zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
            zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
            zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
            zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
            zstyle ':completion:*' special-dirs true
            zstyle ':completion:*' squeeze-slashes true


            # Sort
            zstyle ':completion:*' sort false
            zstyle ":completion:*:git-checkout:*" sort false
            zstyle ':completion:*' file-sort modification
            zstyle ':completion:*:eza' sort false
            zstyle ':completion:complete:*:options' sort false
            zstyle ':completion:files' sort false
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}

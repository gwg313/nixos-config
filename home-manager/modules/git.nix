{
  config,
  lib,
  pkgs,
  user,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "gwg313";
    userEmail = "gwg313@pm.me";

    extraConfig = {
      user = {
        signingkey = "60FF63B4826B7400";
      };
      commit = {
        gpgsign = true;
      };
      diff = {
        algorithm = "patience";
        compactionHeuristic = "true";
        tool = "nvimdiff";
      };
      "difftool \"nvimdiff\"" = {
        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\" -c \"wincmd w\" -c \"wincmd L\"";
      };
      merge = {
        tool = "nvimdiff4";
        prompt = "false";
      };
      "mergetool \"nvimdiff4\"" = {
        cmd = "nvim -d $LOCAL $BASE $REMOTE $MERGED -c '$wincmd w' -c 'wincmd J'";
      };
      mergetool = {
        keepBackup = false;
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        pager = "delta";
        editor = "nvim";
      };
      delta = {
        features = "side-by-side line-numbers decorations";
        navigate = "true";
        whitespace-error-style = "22 reverse";
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };

      color.ui = "1";
    };
    ignores = [
      "__pycache__"
      ".direnv"
      "npm-debug.log"
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.elc"
      "auto-save-list"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
    ];
  };

  programs.zsh = {
    shellAliases = {
      trackme = "git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)";
      rebasemain = "git pull origin main --rebase";
      hist = ''log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
      llog = ''log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
    };
  };

  home.packages = with pkgs; [
    cocogitto
    delta
    lazygit
    gh
    pre-commit
    graphite-cli
    tig
  ];
}

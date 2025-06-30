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
      credential = {
        helper = "!pass-git-helper $@";
      };
      user = {
        signingkey = "60FF63B4826B7400";
      };
      commit = {
        gpgsign = true;
        verbose = "true";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = "true";
        renames = "true";
        compactionHeuristic = "true";
        tool = "nvimdiff";
      };
      "difftool \"nvimdiff\"" = {
        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\" -c \"wincmd w\" -c \"wincmd L\"";
      };
      merge = {
        tool = "nvimdiff4";
        prompt = "false";
        conflictstyle = "zdiff3";
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
        features = "line-numbers decorations";
        navigate = "true";
        whitespace-error-style = "22 reverse";
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      push = {
        default = "simple";
        autoSetupRemote = "true";
        followTags = "true";
      };
      pull = {
        rebase = "true";
      };
      rebase = {
        autoSquash = "true";
        autoStash = "true";
        updateRefs = "true";
      };
      fetch = {
        prune = "true";
        pruneTags = "true";
        all = "true";
      };
      tag = {
        sort = "version:refname";
      };
      branch = {
        sort = "-committerdate";
      };

      help = {
        autocorrect = "true";
      };
      rerere = {
        enabled = "true";
        autoupdate = "true";
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
      g = "lazygit";
      ga = "git add";
      gc = "git commit";
      gcu = "git add . && git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";

      gaa = "git add .";
      gcm = "git commit -m";
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
    pass-git-helper
  ];

  xdg.configFile."pass-git-helper/git-pass-mapping.ini".text = ''
    [git.gwg313.xyz*]
    target=git/https/git.gwg313.xyz
    line_username=1
  '';
}

{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Glen Goodwin";
    userEmail = "glen.goodwin1992@gmail.com";
    extraConfig = {
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
    };
    ignores = [
      "__pycache__"
      ".direnv"
      # Node
      "npm-debug.log"
      "*.swp"
    ];
  };

  programs.zsh = {
    shellAliases = {
      trackme = "git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)";
      rebasemain = "git pull origin main --rebase";
    };
  };

  home.packages = with pkgs; [
    cocogitto
    delta
    lazygit
    gh
    pre-commit
  ];
}

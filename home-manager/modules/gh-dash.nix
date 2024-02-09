{...}: {
  programs.gh-dash = {
    enable = true;
    settings = {
      defaults = {
        prsLimit = 20;
        issuesLimit = 20;
        layout = {
          prs = {
            repo = {
              grow = true;
              width = 10;
              hidden = false;
            };
          };
        };
      };
      prSections = [
        {
          title = "My Pull Requests";
          filters = "is:open author:@me";
        }
        {
          title = "Needs My Review";
          filters = "is:open review-requested:@me";
        }
        {
          title = "Nixvim";
          filters = "is:open repo:nix-community/nixvim";
        }
      ];
      issuesSections = [
        {
          title = "Created";
          filters = "is:open author:@me";
        }
        {
          title = "Assigned";
          filters = "is:open assignee:@me";
        }
        {
          title = "Subscribed";
          filters = "is:open -author:@me";
        }
      ];
      repoPaths = {
        "NixOS/nixpkgs" = "~/repos/nix/nixpkgs";
        "nix-community/*" = "~/repos/nix-community/*";
      };
      keybindings = {
        prs = [
          {
            key = "C";
            command = "tmux split-window -h -c {{.RepoPath}} 'gh pr checkout {{.PrNumber}} && nvim -c \":Octo pr edit {{.PrNumber}}\"'";
          }
        ];
      };
      pager = {
        diff = "delta";
      };
    };
  };
}

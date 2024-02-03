{...}: {
  programs.gh-dash = {
    enable = true;
    settings = {
      prSections = [
        {
          title = "My Pull Requests";
          filters = "is:open author:@me";
        }
        {
          title = "Needs My Review";
          filters = "is:open review-requested:@me";
          limit = 20; # Limits How many are fetched
        }
        {
          title = "Nixvim";
          filters = "is:open repo:nix-community/nixvim";
          limit = 20; # Limits How many are fetched
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
      keybindings = {
        prs = [
          {
            key = "C";
            command = "tmux";
          }
        ];
      };
      pager = {
        diff = "delta";
      };
    };
  };
}

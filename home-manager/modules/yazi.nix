{pkgs, ...}: let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "a3ee7173bff700214bc2d993ef605c3c41d800c9";
    hash = "sha256-m2A/vIgGMzFzhaOgFL21cZua8h2XaYu7Jb6yuZQKiTw=";
  };
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    plugins = {
      chmod = "${plugins-repo}/chmod.yazi";
      full-border = "${plugins-repo}/full-border.yazi";
      max-preview = "${plugins-repo}/max-preview.yazi";
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "dc9989c2bdd3d04e615d3bbb5f3bf99ed6ce1a35";
        sha256 = "sha256-AwBqOKWtz5BzY7Sye1JljWI2t+JQGGQfOT6oQN7YTOg=";
      };
    };

    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
    '';

    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin --sync max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = ["c" "m"];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };
}

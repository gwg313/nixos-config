{ pkgs, ... }:
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "02d18be03812415097e83c6a912924560e4cec6d";
    hash = "sha256-1FZ8wcf2VVp6ZWY27vm1dUU1KAL32WwoYbNA/8RUAog=";
  };
in
{
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
        rev = "af8bf6f82165b83272b6501ce7445cf2c61fbf51";
        sha256 = "sha256-L7MkZZqJ+t+A61ceC4Q1joLF6ytoWdgx9BwZWAGAoCA=";
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
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };
}

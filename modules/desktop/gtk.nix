{ inputs
, pkgs
, ...

}: {

  gtk = {

    cursorTheme = {

      name = "Catppuccin-Mocha-Dark-Cursors";

      package = pkgs.catppuccin-cursors.mochaDark;

    };

    enable = true;


    iconTheme = {

      package = pkgs.catppuccin-papirus-folders.override {

        flavor = "mocha";

        accent = "blue";

      };

      name = "Papirus-Dark";

    };

    theme = {

      package = pkgs.catppuccin-gtk.override {

        size = "compact";

        variant = "mocha";

      };

      name = "Catppuccin-Mocha-Compact-Blue-Dark";

    };

  };

}

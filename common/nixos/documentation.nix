{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.man-pages
    pkgs.man-pages-posix
  ];
  documentation = {
    dev.enable = true;
    man = {
      man-db.enable = false;
      mandoc.enable = true;
    };
  };

  environment.sessionVariables = {
    MANPAGER = "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'";
  };
}

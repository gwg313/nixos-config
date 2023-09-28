{ config, lib, pkgs, user, ... }: {

  home.file."ranger_devicons" = {
    source = pkgs.fetchgit {
      url = "https://github.com/alexanderjeurissen/ranger_devicons.git";
      rev = "main";
      sha256 = "1ra2afxm2167a6ashgbrlilsh5lx696jzdhmfl34jh1w9p4j34g8";
    };

    target = ".config/ranger/plugins/ranger_devicons";
  };

  home.file = {
    ".config/ranger/rc.conf" = {
      text = ''
        default_linemode devicons
        set vcs_backend_git enabled
        set preview_files true
        set preview_directories true
        set collapse_preview true
      '';
    };
  };

  home.packages = with pkgs; [
    ranger
  ];
}

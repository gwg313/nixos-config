{
  # ...
  programs.nixcord = {
    enable = true;
    # quickCss = "some CSS";
    config = {
      # useQuickCss = true;
      themeLinks = [
      ];
      frameless = true; # set some Vencord options
      plugins = {
        hideAttachments.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          # ignoredActivities = [ "someActivity" ];
        };
      };
    };
    extraConfig = {
    };
  };
  # ...
}

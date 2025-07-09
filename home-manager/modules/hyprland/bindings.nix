{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod_ALT, mouse:273, resizewindow"
      "$mod_ALT, mouse:272, resizewindow"
    ];

    "$mod" = "SUPER";

    bind =
      [
        # general binds
        ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
        # "$mod, RETURN, exec, ${pkgs.alacritty}/bin/alacritty"
        "$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
        "$mod,E, exec,  uwsm app -- ${pkgs.xfce.thunar}/bin/thunar" # Thunar
        "$shiftMod,SPACE, exec, hyprfocus-toggle" # Toggle HyprFocus
        "$mod, Q, killactive"
        "SUPER_SHIFT, Q, exec, ${pkgs.wlogout}/bin/wlogout"
        "$mod, SPACE, exec, pkill fuzzel || ${pkgs.fuzzel}/bin/fuzzel" # pkill or allows for toggle
        "$mod,T, togglefloating," # Toggle Floating
        # "$mod, F, fullscreen"
        "$mod,F, fullscreen" # Toggle fullscreen
        "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
        "$mod, B, exec, ${pkgs.grim}/bin/grim \"desktop-$(${pkgs.busybox}/bin/date +\"%Y%m%d%H%m\").png"
        "SUPER_SHIFT, B, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy" # Screenshot selection directly to clipboard

        "$shiftMod,T, exec, hyprpanel-toggle" # Toggle hyprpanel

        "$shiftMod,up, focusmonitor, -1" # Focus previous monitor
        "$shiftMod,down, focusmonitor, 1" # Focus next monitor
        "$shiftMod,left, layoutmsg, addmaster" # Add to master
        "$shiftMod,right, layoutmsg, removemaster" # Remove from master

        # move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod,right,workspace,+1"
        "$mod,left,workspace,-1"

        # Scroll through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod,code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));

    bindl = [
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
    ];

    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ",XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
      ",XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
    ];
  };
}

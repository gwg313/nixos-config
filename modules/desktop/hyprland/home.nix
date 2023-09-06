{ pkgs, ... }:

let
  hyprlandConf = ''
        monitor=,preferred,auto,auto

        # trigger when the switch is turning off
    #    bindl = , switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
        # trigger when the switch is turning on
    #    bindl = , switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"
         bindl=,switch:Lid Switch, exec, displayswitch

        $mainMod=SUPER

        general {
          border_size=3
          gaps_in=5
          gaps_out=7
          col.active_border=rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border=0x66333333
          layout=dwindle
        }

        decoration {
          rounding=5
          multisample_edges=true
          active_opacity=0.93
          inactive_opacity=0.93
          fullscreen_opacity=1
          drop_shadow=false
        }

        animations {
          enabled=true
          bezier = myBezier,0.1,0.7,0.1,1.05
          animation=fade,1,7,default
          animation=windows,1,7,myBezier
          animation=windowsOut,1,3,default,popin 60%
          animation=windowsMove,1,7,myBezier
        }

        input {
          kb_layout=us
          kb_options=caps:ctrl_modifier
          follow_mouse=2
          repeat_delay=250
          numlock_by_default=1
          accel_profile=flat
          sensitivity=0.8
            touchpad {
              natural_scroll=true
              middle_button_emulation=true
              tap-to-click=true
            }
          }
        }

          gestures {
            workspace_swipe=true
            workspace_swipe_fingers=3
            workspace_swipe_distance=100
          }

        dwindle {
          pseudotile=false
          force_split=2
        }

        debug {
          damage_tracking=2
        }

        bindm=$mainMod,mouse:272,movewindow
        bindm=$mainMod,mouse:273,resizewindow

        bind=$mainMod,Return,exec,${pkgs.alacritty}/bin/alacritty
        bind=$mainMod,Q,killactive,
        bind=$mainMod,Escape,exit,
        bind=$mainMod,L,exec,${pkgs.swaylock}/bin/swaylock
        bind=$mainMod,E,exec,${pkgs.pcmanfm}/bin/pcmanfm
        bind=$mainMod,H,togglefloating,
        #bind=$mainMod,Space,exec,${pkgs.rofi}/bin/rofi -show drun
        bind=$mainMod,Space,exec,${pkgs.wofi}/bin/wofi --show drun
        bind=$mainMod,P,pseudo,
        bind=$mainMod,F,fullscreen,
        bind=$mainMod,R,forcerendererreload
        bind=$mainMod,R,exec,${pkgs.hyprland}/bin/hyprctl reload

        bind=$mainMod,left,movefocus,l
        bind=$mainMod,right,movefocus,r
        bind=$mainMod,up,movefocus,u
        bind=$mainMod,down,movefocus,d

        bind=$mainMod SHIFT,left,movewindow,l
        bind=$mainMod SHIFT,right,movewindow,r
        bind=$mainMod SHIFT,up,movewindow,u
        bind=$mainMod SHIFT,down,movewindow,d

        bind=$mainMod,1,workspace,1
        bind=$mainMod,2,workspace,2
        bind=$mainMod,3,workspace,3
        bind=$mainMod,4,workspace,4
        bind=$mainMod,5,workspace,5
        bind=$mainMod,6,workspace,6
        bind=$mainMod,7,workspace,7
        bind=$mainMod,8,workspace,8
        bind=$mainMod,9,workspace,9
        bind=$mainMod,0,workspace,10
        bind=$mainMod,right,workspace,+1
        bind=$mainMod,left,workspace,-1

        bind=$mainMod SHIFT,1,movetoworkspace,1
        bind=$mainMod SHIFT,2,movetoworkspace,2
        bind=$mainMod SHIFT,3,movetoworkspace,3
        bind=$mainMod SHIFT,4,movetoworkspace,4
        bind=$mainMod SHIFT,5,movetoworkspace,5
        bind=$mainMod SHIFT,6,movetoworkspace,6
        bind=$mainMod SHIFT,7,movetoworkspace,7
        bind=$mainMod SHIFT,8,movetoworkspace,8
        bind=$mainMod SHIFT,9,movetoworkspace,9
        bind=$mainMod SHIFT,0,movetoworkspace,10
        bind=$mainMod SHIFT,right,movetoworkspace,+1
        bind=$mainMod SHIFT,left,movetoworkspace,-1

        bind=CTRL,right,resizeactive,20 0
        bind=CTRL,left,resizeactive,-20 0
        bind=CTRL,up,resizeactive,0 -20
        bind=CTRL,down,resizeactive,0 20

        bind=,print,exec,${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f - -o ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png && notify-send "Saved to ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png"

        bind=,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
        bind=,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
        bind=,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
        bind=,XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t
        bind=,XF86MonBrightnessDown,exec,${pkgs.light}/bin/light -U 10
        bind=,XF86MonBrightnessUP,exec,${pkgs.light}/bin/light -A 10

        #windowrule=float,^(Rofi)$
        windowrule=float,title:^(Volume Control)$
        windowrule=float,title:^(Picture-in-Picture)$
        windowrule=pin,title:^(Picture-in-Picture)$
        windowrule=move 75% 75% ,title:^(Picture-in-Picture)$
        windowrule=size 24% 24% ,title:^(Picture-in-Picture)$

        exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once=${pkgs.waybar}/bin/waybar
        exec-once=${pkgs.blueman}/bin/blueman-applet
        exec-once=${pkgs.swaybg}/bin/swaybg -m fill -i $HOME/.config/wall
  '';
in
{
  xdg.configFile."hypr/hyprland.conf".text = hyprlandConf;

  programs.swaylock.settings = {
    image = "$HOME/.config/lock";
    color = "000000f0";
    font-size = "24";
    indicator-idle-visible = false;
    indicator-radius = 100;
    indicator-thickness = 20;
    inside-color = "00000000";
    inside-clear-color = "00000000";
    inside-ver-color = "00000000";
    inside-wrong-color = "00000000";
    key-hl-color = "79b360";
    line-color = "000000f0";
    line-clear-color = "000000f0";
    line-ver-color = "000000f0";
    line-wrong-color = "000000f0";
    ring-color = "ffffff50";
    ring-clear-color = "bbbbbb50";
    ring-ver-color = "bbbbbb50";
    ring-wrong-color = "b3606050";
    text-color = "ffffff";
    text-ver-color = "ffffff";
    text-wrong-color = "ffffff";
    show-failed-attempts = true;
  };

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f"; }
    ];
    systemdTarget = "xdg-desktop-portal-hyprland.service";
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "displayswitch";
      runtimeInputs = [ ];
      text = builtins.readFile ./displayswitch.sh;
    })
  ];
}

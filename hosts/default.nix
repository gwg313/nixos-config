{ lib, inputs, system, home-manager, user, hyprland, devenv, ... }:

{

  thinkpad = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit user inputs hyprland system devenv;
      host = {
        hostName = "thinkpad";
        mainMonitor = "eDP-1";
        #        secondMonitor = "DP-1";
      };
    };
    modules = [
      ./thinkpad
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user devenv inputs; };
        home-manager.users.${user} = {
          imports = [ (import ./home.nix) ] ++ [ (import ./thinkpad/home.nix) ];

        };
      }
    ];

  };






}

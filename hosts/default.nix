{ lib, inputs, system, user, ... }:

{

  thinkpad = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit user inputs system;
      host = {
        hostName = "thinkpad";
        mainMonitor = "eDP-1";
        #        secondMonitor = "DP-1";
      };
    };
    modules = [
      ./thinkpad
      ./configuration.nix
      ../modules/themes/home.nix
      inputs.nix-index-database.nixosModules.nix-index
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} = {
          imports = [ (import ./home.nix) ] ++ [ (import ./thinkpad/home.nix) ];

        };
      }
    ];
  };






}

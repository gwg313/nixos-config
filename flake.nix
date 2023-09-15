{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      # Official Hyprland flake
      url = "github:vaxerski/Hyprland"; # Add "hyprland.nixosModules.default" to the host modules
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = {
      url = "github:cachix/devenv/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, devenv, ... }@inputs:

    let
      system = "x86_64-linux";
      user = "glen";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;

    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          specialArgs = { inherit inputs; };
          inherit inputs user system home-manager hyprland devenv;
        }
      );
    };

}

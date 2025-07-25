{
  description = "gwg313 Nix configs";

  inputs = {
    # Nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-24_05.url = "github:NixOS/nixpkgs/nixos-24.05";
    secrets.url = "git+ssh://git@github.com/gwg313/nixos-secrets.git";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
    };

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      # Don't follow nixpkgs or cache will miss
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixcord.url = "github:kaylorben/nixcord";
    devenv = {
      url = "github:cachix/devenv/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";

    # neovim-config.url = "github:gwg313/nvim-nix";

    sops-nix.url = "github:Mic92/sops-nix";

    superfile = {
      url = "github:MHNightCat/superfile";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
    colmena.url = "github:zhaofengli/colmena";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      colmena,
      nix-ld,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
      user = "gwg313";
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeModules = import ./modules/home-manager;

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            inherit (self.checks.${system}.pre-commit-check) shellHook;
            buildInputs = with pkgs; [
              alejandra
              apacheHttpd
              jq
            ];
          };
        }
      );

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt-rfc-style.enable = true;
            };
          };
        }
      );

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        candlekeep = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit user inputs outputs;
          };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/candlekeep/configuration.nix
            nix-ld.nixosModules.nix-ld
          ];
        };
      };

      nixosConfigurations = {
        grymforge = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit user inputs outputs;
          };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/grymforge/configuration.nix
          ];
        };
      };

      nixosConfigurations = {
        iso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit user inputs outputs;
          };
          modules = [
            # > Our main nixos configuration file <

            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            ./hosts/iso/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "gwg313@candlekeep" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/machines/candlekeep.nix
            inputs.nixcord.homeModules.nixcord
            inputs.stylix.homeModules.stylix
          ];
        };
      };

      homeConfigurations = {
        "gwg313@grymforge" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/machines/grymforge.nix
            inputs.nixcord.homeModules.nixcord
            inputs.stylix.homeModules.stylix
          ];
        };
      };

      homeConfigurations = {
        "gwg313@dorino" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/machines/dorino.nix
            inputs.stylix.homeModules.stylix
          ];
        };
      };

      # colmena managed systems
      colmenaHive = colmena.lib.makeHive self.outputs.colmena;
      colmena = {
        meta = {
          specialArgs = {
            inherit user inputs outputs;
          };
          nixpkgs = import nixpkgs {
            system = "x86_64-linux";
          };
        };

        waypoint = {
          deployment = {
            targetHost = "waypoint"; # <- defined in ~/.ssh/config
          };
          imports = [ ./hosts/waypoint/configuration.nix ];
        };

        # kerby = {
        #   deployment = {
        #     targetHost = "waypoint"; # <- defined in ~/.ssh/config
        #   };
        #   imports = [./hosts/kerby/configuration.nix];
        # };

        seikan = {
          deployment = {
            targetHost = "seikan"; # <- defined in ~/.ssh/config
          };
          imports = [ ./hosts/seikan/configuration.nix ];
        };

        panopticon = {
          deployment = {
            targetHost = "panopticon"; # <- defined in ~/.ssh/config
          };
          imports = [ ./hosts/panopticon/configuration.nix ];
        };

        vault-tec = {
          deployment = {
            targetHost = "vault-tec"; # <- defined in ~/.ssh/config
          };
          imports = [ ./hosts/vault-tec/configuration.nix ];
        };
      };
    };
}

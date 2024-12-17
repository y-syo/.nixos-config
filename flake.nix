{
  description = "yosyo's flake config :3";

  inputs = {

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix/release-24.05";

    fabric.url = "github:Fabric-Development/fabric";

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    pogit = {
      url = "github:y-syo/pogit";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sh-koh = {
      url = "github:sh-koh/nixos-config/009e4d2a1604c6bfa48aa5766115a0babc12ad02";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, unstablepkgs, home-manager, ... }:
    let
      unstableOverlay = final: prev: {
        unstable = import unstablepkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
      sfmonoOverlay = final: prev: {
        sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
          pname = "sf-mono-liga-bin";
          version = "dev";
          src = inputs.sf-mono-liga-src;
          dontConfigure = true;
          installPhase = ''
            mkdir -p $out/share/fonts/opentype
            cp -R $src/*.otf $out/share/fonts/opentype/
          '';
        };
      }; 
      inherit (self) outputs;
      systems = [ "x86_64-linux" ];
      forSystems = nixpkgs.lib.genAttrs systems;
    in
      {
        packages = forSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
        nixosConfigurations = {
          T470 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs outputs; };
            modules = [ ./hosts/T470/default.nix ];
          };
          rei-ayanami = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs outputs; };
            modules = [
              {
                nixpkgs = {
                    overlays = [ unstableOverlay sfmonoOverlay ];
                    config.allowUnfree = true; # this is the only allowUnfree that's actually doing anything
                  };
                }
              ./hosts/rei-ayanami/default.nix
            ];
          };
          nurture = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs outputs; };
            modules = [
              {
                nixpkgs = {
                  overlays = [ unstableOverlay sfmonoOverlay ];
                  config.allowUnfree = true; # this is the only allowUnfree that's actually doing anything
                };
                nix.settings = {
                  extra-substituters = [ "https://ezkea.cachix.org" ];
                  extra-trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
                };
              }
              ./hosts/nurture/default.nix
            ];
          };
        };
        homeConfigurations = {
          "yosyo" = home-manager.lib.homeManagerConfiguration {
            #pkgs = forSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./home/yosyo/home.nix ];
          };
          "mmoussou" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = { inherit inputs; };
            modules = [ ./home/mmoussou/home.nix ];
          };
        };
      };
}

{
  description = "yosyo's Flake config :3";

  inputs = {

   home-manager = {
     url = "github:nix-community/home-manager/release-24.05";
     inputs.nixpkgs.follows = "nixpkgs";
   };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix/release-24.05";

	#gross.url = "github:fufexan/gross";

	fabric.url = "github:Fabric-Development/fabric/rewrite";

	nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	pogit = {
		url = "github:y-syo/pogit";
		inputs.nixpkgs.follows = "nixpkgs";
	};

  };

  outputs = inputs@{ self, nixpkgs, unstablepkgs, nixos-cosmic, ... }:
  let
	unstableOverlay = final: prev: {
	  unstable = import unstablepkgs {
		system = "x86_64-linux";
		config.allowUnfree = true;
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
		  nix.settings = {
            extra-substituters = [ "https://cosmic.cachix.org/" "https://ezkea.cachix.org" ];
			extra-trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
          };
		}
		({
          nixpkgs = {
            overlays = [ unstableOverlay ];
            config.allowUnfree = true; # this is the only allowUnfree that's actually doing anything
          };
        })
			nixos-cosmic.nixosModules.default
			./hosts/rei-ayanami/default.nix
		];
      };
    };
  };
}

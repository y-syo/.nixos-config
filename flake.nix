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

    gross.url = "github:fufexan/gross";

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
  let
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
    };
  };
}

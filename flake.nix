{
  description = "yosyo's Flake config :3";

  inputs = {

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    stylix.url = "github:danth/stylix/release-23.11";

    gross.url = "github:fufexan/gross";

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, gross, ags, ... }: {
    nixosConfigurations = {
      T470 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/T470/default.nix ];
      };
    };
  };
}

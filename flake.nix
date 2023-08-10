{
  description = "yosyo's Flake configuration :D";

  inputs = {

    # Stylix
    stylix.url = "github:danth/stylix/release-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # hyprsome
    hyprsome.url = "github:sopa0/hyprsome";

    # gross
    gross.url = "github:fufexan/gross";
  };

  outputs = inputs@{ self, nixpkgs, hyprsome, stylix, home-manager, gross, ... }: {
    nixosConfigurations = {
      outerwilds = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}

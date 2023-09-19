{
  description = "yosyo's Flake configuration :D";

  inputs = {

    # Stylix
    # stylix.url = "github:danth/stylix/release-23.05";
    stylix.url = "github:danth/stylix";

    # home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Liga SFMono Nerd Font
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # NixVim
    nixvim.url = "github:nix-community/nixvim/nixos-23.05";

    # hyprsome
    hyprsome.url = "github:sopa0/hyprsome";

    # gross
    gross.url = "github:fufexan/gross";

    # ags
    ags.url = "github:Aylur/ags";

    # HSR & GI
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-substituters = [ "https://ezkea.cachix.org" ];
    extra-trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };

  outputs = inputs@{ self, nixpkgs, hyprsome, stylix, home-manager, gross, aagl, ags, nixvim, ... }: {
    nixosConfigurations = {
      outerwilds = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = [
	  {
		imports = [ aagl.nixosModules.default ];
		nix.settings = aagl.nixConfig; # Set up Cachix
		programs.honkers-railway-launcher.enable = true;
	  }
	  ./configuration.nix
        ];
      };
    };
  };
}

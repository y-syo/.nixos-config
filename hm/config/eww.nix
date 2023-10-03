{ config, pkgs, ... }:


let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # nixpkgs.config = {
  # allowUnfree = true;
  # packageOverrides = pkgs: {
  #   unstable = import <nixpkgs-unstable> {
  #     config = config.nixpkgs.config;
  #     };
  #   };
  # };
  programs.eww = {
	enable = true;
	package = unstable.pkgs.eww-wayland;
	configDir = ./eww;
    };
}

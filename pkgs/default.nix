{ pkgs, ... }:

{
  #hyprXPrimary = pkgs.callPackage ./hyprXPrimary { };
  hyprsplit = pkgs.callPackage ./hyprsplit { };
}

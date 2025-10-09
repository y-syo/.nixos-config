{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/zed.nix
    ../shared/zsh.nix
    ../shared/stylix.nix
    ../shared/dev-env.nix
  ];

  home.packages = with pkgs; [
    neovim
    feishin
  ];


  home.username = "mmoussou";
  home.homeDirectory = "/home/mmoussou";
  home.stateVersion = "25.11"; # Match your Home Manager version
  programs.home-manager.enable = true;
}

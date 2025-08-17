{ config, pkgs, inputs, ... }:

{
  imports = [
    ../yosyo/hyprland.nix
    ../yosyo/waybar.nix
    ../yosyo/tofi.nix

    ../shared/zsh.nix
    ../shared/kitty.nix
    ../shared/stylix.nix
    ../shared/dev-env.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    neovim
    git
    swww
    nautilus
    vesktop
    grim slurp wl-clipboard brightnessctl mpv

	tetrio-desktop
  ];


  home.username = "yosyo";
  home.homeDirectory = "/home/yosyo";
  home.stateVersion = "24.11"; # Match your Home Manager version
  programs.home-manager.enable = true;
}

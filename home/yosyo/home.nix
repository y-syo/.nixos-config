{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./fht-compositor.nix
    ./swaylock.nix
    ./tofi.nix

    ../shared/dev.nix
    ../shared/stylix.nix
    ../shared/kitty.nix
    ../shared/zsh.nix
    ../shared/emacs.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "y-syo";
      userEmail = "mmoussou@student.42angouleme.fr";
    };
    gh.enable = true;
  };

  home.username = "yosyo";
  home.homeDirectory = "/home/yosyo";

  home.packages = with pkgs; [
    bottles

    dconf

    swww

    firefox nautilus libreoffice

    neovim android-tools scrcpy
    drawing mpv spotify qbittorrent signal-desktop vesktop easyeffects obs-studio
  ];

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}

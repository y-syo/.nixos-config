{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
  imports = [
    ./dev.nix

    ./conf/stylix.nix
    ./conf/kitty.nix
    ./conf/zsh.nix
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

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}

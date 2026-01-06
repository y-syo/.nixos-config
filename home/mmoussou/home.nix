{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
  imports = [
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

  home.username = "mmoussou";
  home.homeDirectory = "/nfs/homes/mmoussou";

  home.packages = with pkgs; [
    dconf
    neovim
  ];

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}

{ inputs, outputs, lib, config, pkgs, theme, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./config/zsh.nix
    ./config/stylix.nix
    ./config/kitty.nix
    ./config/vscode.nix
	./config/hyprland.nix
  ];

  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
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

  xdg.desktopEntries = {
    yuzu = {
	name = "yuzu - The Right One";
	icon = "yuzu";
	exec = "env QT_QPA_PLATFORM=xcb yuzu";
      };
  };

  # Set your username
  home.username = "yosyo";
  home.homeDirectory = "/home/yosyo";

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

{ inputs, outputs, lib, config, pkgs, theme, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./config/zsh.nix
    ./config/stylix.nix
    ./config/kitty.nix
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
    kitty = {
      enable = true;
      extraConfig = ''
      enable_audio_bell no
      window_padding_width	10
      window_padding_height	10
      tab_bar_min_tabs		1
      tab_bar_edge		bottom
      tab_bar_style		powerline
      tab_powerline_style	slanted
      tab_title_template	{title}{" :{}:".format(num_windows) if num_windows > 1 else ""}
      '';
    };
    git = {
      enable = true;
      userName = "y-syo";
      userEmail = "mmoussou@student.42angouleme.fr";
    };
    gh.enable = true;
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

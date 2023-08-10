# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, theme, ... }: {
  # You can import other home-manager modules here
  imports = [
    inputs.stylix.homeManagerModules.stylix

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    # overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    # ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  stylix = {
    image = ./wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    opacity.terminal = 0.8;

    fonts = {
      monospace = {
	name = "cozette";
	package = pkgs.cozette;
	# name = "JetBrainsMono-Regular";
	# package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };

     serif = { # config.stylix.fonts.monospace;
	name = "JetBrainsMono-Regular";
	package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
     };

    sansSerif = config.stylix.fonts.serif;

    # sizes.applications = 14;
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
    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
	re = "sudo nixos-rebuild switch";
	ls = "lsd";
	grep = "grep --color=auto";
	cat = "bat";
	kys = "shutdown now";
      };
      initExtra = ''
	#Prompt
	autoload -Uz vcs_info

	zstyle ':vcs_info:git*' formats "%F{yellow}( %b)%f %F{cyan}%r%f "
	precmd() {vcs_info}
	setopt prompt_subst

	PROMPT='%F{blue} %n%f | %F{green}/%1~%f ❯ '
	RPROMPT=\$vcs_info_msg_0_
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

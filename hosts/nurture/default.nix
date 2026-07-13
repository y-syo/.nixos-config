{ pkgs, lib, config, inputs, outputs, ... }:

{
  imports =
    [
      ./hw.nix
      ./networking.nix
      ./services.nix
      ./boot.nix
      ./env.nix

	  ./lix.nix

      inputs.home-manager.nixosModules.home-manager
      #inputs.fht-compositor.nixosModules.default
    ];

  virtualisation = {
    docker.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  hardware = {
    xpadneo.enable = true;
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  security = {
    pam.services.swaylock = {};
    polkit.enable = true;
  };

  /*xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = [ "gtk" ];
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };*/

  users.users.yosyo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" "seat" "networkmanager" "docker" "bluetooth" "jackaudio" ];
  };

  environment.systemPackages = with pkgs; [
    alsa-plugins xdg-utils vulkan-tools vulkan-validation-layers mate.mate-polkit seatd gcc mesa

    wget curl killall jaq socat ripgrep jc btop-rocm fastfetch

    grim slurp wl-clipboard playerctl brightnessctl gammastep wayland wayland-protocols xdg-utils
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.yosyo = import ../../home/yosyo/home.nix;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}

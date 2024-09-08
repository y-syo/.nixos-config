{ pkgs, lib, config, inputs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./networking.nix
      ./services.nix
      ./boot.nix
      ./env.nix

      inputs.home-manager.nixosModules.home-manager
    ];

  virtualisation.docker.enable = true;

  nixpkgs = {
    config = {
	  allowUnfree = true;
	};
    overlays = [
	  (final: _prev: import ../../pkgs { pkgs = final; })
	];
  };

  programs = {
    steam.enable = true;
    hyprland.enable = true;
    zsh.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  security = {
    pam.services.swaylock = {};
  };

  users.users.yosyo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" "seat" "networkmanager" "docker" ];
    # packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    xdg-utils vulkan-tools vulkan-validation-layers mate.mate-polkit seatd

    wget curl killall jaq socat ripgrep jc btop fastfetch pogit

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
    users.yosyo = import ../../home/home.nix;
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
  system.stateVersion = "24.05"; # Did you read the comment?
}

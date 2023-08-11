# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, inputs, outputs, ... }:

{
  # allow non-FOSS apps (deprecated and bad)
  nixpkgs.config.allowUnfree = true;

  imports =
  [ 
      # import Home Manager
      inputs.home-manager.nixosModules.home-manager

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];



  # environment and session variables

  environment = {
#    variables = {
#      GBM_BACKEND = "nvidia-drm";
#      LIBVA_DRIVER_NAME = "nvidia";
#      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
#      __GL_DXVK_OPTIMIZATIONS = "1";
#      __NVD_BACKEND = "direct";
#      STAGING_SHARED_MEMORY = "1";
#      STAGING_WRITECOPY = "1";
#    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      EDITOR = "vim";
      # VISUAL = "codium";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      # QT_QPA_PLATFORM = "wayland;xcb";
      # SDL_VIDEODRIVER = "wayland,x11";
      WLR_NO_HARDWARE_CURSORS = "1";
      # WLR_RENDERER = "vulkan";
      CLUTTER_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_WEBRENDER = "1";
      GDK_BACKEND = "wayland";
      KITTY_ENABLE_WAYLAND = "1";
    };
  };

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.blacklistedKernelModules = [ "nouveau" ]; # nouveau hate club, all my homies hate nouveau
  boot.loader.grub.device = "nodev";
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "outerwilds"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # OpenGL 32Bit & 64Bit support

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    nvidiaPatches = true;
  };
  programs.zsh.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
      layout = "us";
      xkbVariant = "intl";
      libinput = {
        enable = true;
        mouse.accelProfile = "flat";
      };
    };
    zerotierone = {
      enable = true;
      joinNetworks = [ "52b337794fa1f40e" ];
    };
    fstrim.enable = true;
  };

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yosyo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "video" "seat" ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   noisetorch
    # ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # essentials / utils / libs / others / shitposting
    vim wget curl neofetch grim slurp wl-clipboard wget nix-index mpv wayland wayland-protocols libva-utils vulkan-tools vulkan-headers vulkan-validation-layers libcamera xdg-utils mate.mate-polkit seatd pciutils bat lsd killall jaq socat ripgrep dunst playerctl jc brightnessctl
    # apps
    discord firefox cinnamon.nemo steam drawing spotify obs-studio easyeffects
    # rice
    swww macchina zsh wofi inputs.hyprsome.packages."${pkgs.system}".default eww-wayland inputs.gross.packages."${pkgs.system}".default
  ];

  fonts = {
    fonts = with pkgs; [ cozette tamsyn jetbrains-mono ];
  };

  xdg = {
    sounds.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.yosyo = import ./hm/home.nix;
  };

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
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}


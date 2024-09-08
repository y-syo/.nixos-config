# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a004f258-3429-444c-b759-31cdf31ffb6d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/23CC-D3BE";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware = {
    nvidia = {
      nvidiaPersistenced = true;
      open = false;
      prime = {
        # allowExternalGpu = false;
	    sync.enable = false;
	    # reverseSync.enable = false;
	    #offload = {
	    #  enable = true;
	    #  enableOffloadCmd = true;
	    # };
	    nvidiaBusId = "PCI:1:0:0";
	    amdgpuBusId = "PCI:7:0:0";
	  };
	  powerManagement = {
	    enable = true;
		# finegrained = true;
      };
      package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.beta;
      modesetting.enable = true;
      nvidiaSettings = false;
    };
  };
}

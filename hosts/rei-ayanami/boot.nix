{ pkgs, lib, config, inputs, outputs, ... }:

{


  boot = {
  	initrd = {
		availableKernelModules = [ "nvme" "xhci_pci" "uas" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  	};
	kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
	kernelParams = [ "nvidia-drm.fbdev=1" ];
	kernelModules = [ "kvm-amd"
			  "uinput"
			  "nvidia"
			  "nvidia_drm"
			  "nvidia_uvm"
			  "nvidia_modeset"
			];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
	default = "saved";
      };
	};
  };
}

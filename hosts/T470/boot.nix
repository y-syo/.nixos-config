{ pkgs, lib, config, inputs, outputs, ... }:

{
  boot = {
	kernelModules = [ "uinput" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        # useOSProber = true;
      };
	};
  };
}

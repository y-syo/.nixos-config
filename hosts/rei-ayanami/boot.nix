{ pkgs, lib, config, inputs, ... }:

let
  windowsConf = ''
    title  Windows
    efi     /shellx64.efi
    options -nointerrupt -noconsolein -noconsoleout HD753a3fb51:EFI\Microsoft\Boot\Bootmgfw.efi

  '';
in
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "uas" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
    };
    kernelPackages = pkgs.unstable.linuxKernel.packages.linux_xanmod_latest;
    kernelParams = [ "nvidia-drm.fbdev=1" ];
    kernelModules = [ "kvm-amd"
                      "uinput"
                      "nvidia"
                      "nvidia_drm"
                      "nvidia_uvm"
                      "nvidia_modeset"
                    ];
    kernel.sysctl = {
      "vm.max_map_count" = "16777216";
    };
    loader = {
      efi = {
        canTouchEfiVariables = true;
		efiSysMountPoint = "/boot";
      };
      #grub = {
      #  enable = true;
      #  efiSupport = true;
      #  device = "nodev";
      #  useOSProber = true;
      #  default = "saved";
      #};
	  systemd-boot = {
	    enable = lib.mkForce false;
		consoleMode = "max";
        extraFiles."shellx64.efi" = pkgs.edk2-uefi-shell.efi;
        extraEntries."windows.conf" = windowsConf;
	  };
    };
	lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
	  package = lib.mkForce (
        pkgs.writeShellApplication {
          name = "lzbt";
          runtimeInputs = [
            inputs.lanzaboote.packages.${pkgs.system}.tool
            pkgs.coreutils
            pkgs.sbctl
          ];
          text = ''
            lzbt "$@"
            MP='${config.boot.loader.efi.efiSysMountPoint}'
            cp -f '${pkgs.edk2-uefi-shell.efi}' "$MP/shellx64.efi"
            mkdir -p "$MP/loader/entries"
            sbctl sign -s "$MP/shellx64.efi"
            cat << EOF > "$MP/loader/entries/windows.conf"
            ${windowsConf}
            EOF
          '';
		}
	  );
    };
  };
}

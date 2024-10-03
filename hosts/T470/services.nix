{ pkgs, lib, config, inputs, outputs, ... }:

{
  services = {
	  udev.extraRules = ''
      KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
    '';
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
	    xkb = {
        layout = "us";
        variant = "intl";
	    };
    };
	  libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
    openssh.enable = true;
    fstrim.enable = true;
	  avahi = {
	    enable = true;
	    reflector = true;
	    nssmdns4 = true;
	    publish = {
	      enable = true;
		    addresses = true;
		    userServices = true;
		    workstation = true;
	    };
	  };
  };
}

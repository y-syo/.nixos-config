{ pkgs, lib, config, inputs, outputs, ... }:

{
  services = {
    #	udev.extraRules = ''
    #      KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
    #    '';
	  gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
    	videoDrivers = [ "nvidia" "amdgpu" ];
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
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}

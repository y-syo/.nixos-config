{ pkgs, lib, config, inputs, outputs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs = {
    swaylock = {
	  enable = true;
	};
    ags = {
      enable = true;
      # configDir = ./conf/desktop/ags;
	  configDir = config.lib.file.mkOutOfStoreSymlink "/home/yosyo/.nixos/home/conf/desktop/ags";
	  extraPackages = with pkgs; [
        bash
        dart-sass
        coreutils
        jq
		pulseaudio
      ];
	};
  };

  systemd.user.services.ags = {
    Unit = {
	  Description = "Aylur's Gtk Shell";
	  PartOf = [ "graphical-session.target" ];
    };
	Service = {
	  Environment = "PATH=/run/wrapper/bin:${lib.makeBinPath config.programs.ags.extraPackages}";
	  ExecStart = "${config.programs.ags.package}/bin/ags";
	  Restart = "on-failure";
	};
	Install.WantedBy = [ "graphical-session.target" ];
  };

  xdg.configFile = {
    tofi = {
      source = config.lib.file.mkOutOfStoreSymlink ./conf/desktop/tofi;
      target = "tofi";
    };
  };
}

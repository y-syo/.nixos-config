{ pkgs, lib, config, inputs, outputs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = conf/desktop/ags;
    extraPackages = with pkgs; [
      bash
      dart-sass
      coreutils
      jq
    ];
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
}

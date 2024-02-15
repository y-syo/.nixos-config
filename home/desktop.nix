{ pkgs, lib, config, inputs, outputs, ... }:

{
	imports = [
	  input.ags.homeManagerModules.default
	];

    programs.ags = {
      enable = true;
	  configDir = conf/desktop/ags;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
	};
}

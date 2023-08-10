{ config, inputs, ... }:

{
	imports = [
	    	inputs.stylix.homeManagerModules.stylix
	];

	stylix = {
		image = ./wallpaper.png;
		polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

		opacity.terminal = 0.8;

		fonts = {
			monospace = {
				name = "cozette";
				package = pkgs.cozette;
				# name = "JetBrainsMono-Regular";
				# package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
			};

			serif = { # config.stylix.fonts.monospace;
				name = "JetBrainsMono-Regular";
				package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
			};

			sansSerif = config.stylix.fonts.serif;
		};
	};
}

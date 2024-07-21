{ config, inputs, pkgs, ... }:

{
	imports = [
	    	inputs.stylix.homeManagerModules.stylix
	];

	stylix = {
		enable = true;
		image = pkgs.fetchurl {
      		url = "https://image.api.playstation.com/vulcan/ap/rnd/202109/1700/08dIur063wTrzgcQOd3lBC7l.png";
      		sha256 = "sha256-ohcWmrHXDfiE9sVd4uL3W4cMfnBCnE52+ofPzkqK8aE=";
		};
		polarity = "dark";
		opacity = {
			applications = 1.0;
			desktop = 1.0;
			popups = 1.0;
			terminal = 0.8;
		};

		fonts = {
			monospace = {
				name = "JetBrainsMono-Regular";
				package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
			};

			serif = config.stylix.fonts.monospace;

			sansSerif = config.stylix.fonts.serif;
		};

		base16Scheme = {
			base00 = "#171B24";
			base01 = "#1F2430";
			base02 = "#242936";
			base03 = "#707A8C";
			base04 = "#8A9199";
			base05 = "#CCCAC2";
			base06 = "#D9D7CE";
			base07 = "#F3F4F5";
			base08 = "#F28779";
			base09 = "#FFAD66";
			base0A = "#FFD173";
			base0B = "#D5FF80";
			base0C = "#95E6CB";
			base0D = "#5CCFE6";
			base0E = "#D4BFFF";
			base0F = "#F29E74";
		};
		targets.gtk.extraCss = ''
@define-color accent_color #F28779;
@define-color accent_bg_color #F28779;
'';

	};
}

{ config, inputs, pkgs, ... }:

{
	imports = [
	    	inputs.stylix.homeManagerModules.stylix
	];

	stylix = {
		image = pkgs.fetchurl {
      		url = "https://image.api.playstation.com/vulcan/ap/rnd/202109/1700/08dIur063wTrzgcQOd3lBC7l.png";
      		sha256 = "sha256-ohcWmrHXDfiE9sVd4uL3W4cMfnBCnE52+ofPzkqK8aE=";
			# url = "https://cdn.discordapp.com/emojis/991440972259000461.gif";
			# sha256 = "sha256-sYWYB0r2tabk97CMxzkaYrEylsBg9QGCLsPO1L+t4Q8=";
		};
		polarity = "dark";
		base16Scheme = {
          scheme = "Cute";
author = "y-syo";
base00 = "050505"; # ----
base01 = "2b2b2b"; # ---
base02 = "606060"; # --
base03 = "8d8d8d"; # -
base04 = "b8b5b1"; # +
base05 = "d2c7bb"; # ++
base06 = "ede0d1"; # +++
base07 = "fff0e0"; # ++++
base08 = "de3c3c"; # red
base09 = "ed9138"; # orange
base0A = "e6ce49"; # yellow
base0B = "97b735"; # green
base0C = "6accbb"; # cyan
base0D = "4a8ae0"; # blue
base0E = "d45db9"; # purple
base0F = "7a7a7a"; # grey
		};
#		targets.gtk.extraCss = ''
#@define-color accent_color #de3c3c;
#@define-color accent_bg_color #de3c3c;
#'';
		opacity.terminal = 0.8;

		fonts = {
			monospace = {
				name = "JetBrainsMono-Regular";
				package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
			};

			serif = config.stylix.fonts.monospace;

			sansSerif = config.stylix.fonts.serif;
		};
	};
}

{ config, inputs, pkgs, ... }:

{
	imports = [
	    	inputs.stylix.homeManagerModules.stylix
	];

	stylix = {
		image = pkgs.fetchurl {
      		# url = "https://image.api.playstation.com/vulcan/ap/rnd/202109/1700/08dIur063wTrzgcQOd3lBC7l.png";
      		# sha256 = "sha256-ohcWmrHXDfiE9sVd4uL3W4cMfnBCnE52+ofPzkqK8aE=";
			url = "https://i.redd.it/1d4h3lm2xwrb1.png";
			sha256 = "sha256-DkkdLi7RqzYm2IXxKlauXMnCkvSqNJEI/2gdI5CD0/4=";
		};
		polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
		targets.gtk.extraCss = ''
@define-color accent_color #cba6f7;
@define-color accent_bg_color #cba6f7;
'';
		opacity.terminal = 0.8;

#		fonts = {
#			monospace = {
#				name = "Liga SFMono Nerd Font";
#				package = pkgs.sf-mono-liga-bin;
#				# name = "JetBrainsMono-Regular";
#				# package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
#			};
#
#			serif = { # config.stylix.fonts.monospace;
#				name = "JetBrainsMono-Regular";
#				package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
#			};
#
#			sansSerif = config.stylix.fonts.serif;
#		};
	};
}

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
    base00 = "#0F1419"; # #0F1419 ----
    base01 = "#131721"; # #131721 ---
    base02 = "#272D38"; # #272D38 --
    base03 = "#3E4B59"; # #3E4B59 -
    base04 = "#BFBDB6"; # #BFBDB6 +
    base05 = "#E6E1CF"; # #E6E1CF ++
    base06 = "#E6E1CF"; # #E6E1CF +++
    base07 = "#F3F4F5"; # #F3F4F5 ++++
    base08 = "#AC4142"; # #AC4142 Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#D28445"; # #D28445 Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#F4BF75"; # #F4BF75 Classes, Markup Bold, Search Text Background
    base0B = "#90A959"; # #90A959 Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#75B5AA"; # #75B5AA Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "#6A9FB5"; # #6A9FB5 Functions, Methods, Attribute IDs, Headings
    base0E = "#AA759F"; # #AA759F Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "#AA759F"; # #AA759F Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
		};
		targets.gtk.extraCss = ''
@define-color accent_color #AC4142;
@define-color accent_bg_color #AC4142;
'';

	};
}

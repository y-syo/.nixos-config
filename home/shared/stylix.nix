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
        name = "Liga SFMono Nerd Font";
        package = pkgs.sf-mono-liga-bin;
      };

      serif = config.stylix.fonts.monospace;

      sansSerif = config.stylix.fonts.serif;
    };

    base16Scheme = {
      base00 = "#171B24"; # #0F1419 ----
      base01 = "#1F2430"; # #131721 ---
      base02 = "#242936"; # #272D38 --
      base03 = "#707A8C"; # #3E4B59 -
      base04 = "#8A9199"; # #BFBDB6 +
      base05 = "#CCCAC2"; # #E6E1CF ++
      base06 = "#D9D7CE"; # #E6E1CF +++
      base07 = "#F3F4F5"; # #F3F4F5 ++++
      base08 = "#F28779"; # #AC4142 Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "#FFAD66"; # #D28445 Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "#FFD173"; # #F4BF75 Classes, Markup Bold, Search Text Background
      base0B = "#D5FF80"; # #90A959 Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "#95E6CB"; # #75B5AA Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "#5CCFE6"; # #6A9FB5 Functions, Methods, Attribute IDs, Headings
      base0E = "#D4BFFF"; # #AA759F Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "#F29E74"; # #AA759F Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    };
    targets.gtk.extraCss = ''
@define-color accent_color #F28779;
@define-color accent_bg_color #F28779;
'';

  };
}

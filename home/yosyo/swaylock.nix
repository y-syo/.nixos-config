{ pkgs, lib, config, inputs, outputs, ... }:

{
#  imports = [
#    inputs.ags.homeManagerModules.default
#  ];

  programs = {
    swaylock = {
	  enable = true;
	};
  };
}

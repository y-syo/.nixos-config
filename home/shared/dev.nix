{ pkgs, lib, config, inputs, outputs, ... }:

{
  imports = [
    inputs.pogit.homeManagerModules.default
  ];


  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
	  pogit = {
	    enable = true;
	    #config = {
      #  format = "TODO";
      #  feat = {
      #    icon = "🐶";
      #    default_msg = "a default message.";
      #  };
      #};
	  };
  };
}

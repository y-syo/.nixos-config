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
      config = {
        nix = {
          icon = "❄️";
          default_msg = "nixed the project.";
        };
        feet = {
          icon = "🦶";
          default_msg = "added feets to the project, now it walks.";
        };
        wut = {
          icon = "❓";
          default_msg = "i have no clue what's going on anymore...";
        };
      };
    };
  };
}

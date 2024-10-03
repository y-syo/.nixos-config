{ pkgs, config, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
    #extraConfig = ;
  };
}

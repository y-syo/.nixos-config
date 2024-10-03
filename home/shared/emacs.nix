{ pkgs, config, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [ nix-mode python-mode projectile whitespace-cleanup-mode smart-tabs-mode auto-complete ];
  };
}

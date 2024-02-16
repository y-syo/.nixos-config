{ pkgs, lib, config, inputs, outputs, ... }:

{
  # home.packages = with pkgs;
  # [
  #   valgrind gcc norminette python3
  # ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

{inputs, outputs, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs.anime-game-launcher.enable = true;
}

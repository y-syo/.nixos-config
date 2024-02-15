{ pkgs, lib, config, inputs, outputs, ... }:

{
  home.packages = with pkgs;
  [
    valgrind gcc norminette python3
  ];
}

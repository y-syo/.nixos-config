{ default, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = {
	neo-tree.enable = true;
	gitsigns.enable = true;
#	toggleterm.enable = true;
	which-key.enable = true;
	nix.enable = true;
    };
    colorschemes.catppuccin.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
	yuck-vim
    ];
  };
}

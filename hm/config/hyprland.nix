{ config, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		extraConfig = ''

		'';
	}
}

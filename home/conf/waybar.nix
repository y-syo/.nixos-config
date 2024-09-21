{ config, ... }:

{
	programs.waybar = {
		enable = true;
		settings = {
			bar = {
				layer = "top";
				modules-left = [ "custom/distro" "hyprland/workspaces" ];
				modules-center = [ "clock" ];
				modules-right = [ "custom/prev" "custom/playpause" "custom/next" "mpris#player" "custom/wp1" "custom/wp2" "pulseaudio/slider" "network" "battery" ];
				output = [ "eDP-1" "HDMI-A-1" ];
				"custom/distro" = {
					format = "";
					tooltip = false;
				};
				"hyprland/workspaces" = {
					format = "{icon}";
					tooltip = false;
					"persistent_workspaces" = {
						"eDP-1" = [ 1 2 3 4 5 6 ];
						"HDMI-A-1" = [ 11 12 13 14 15 16 ];
					};
					format-icons = {
						"11" = "1";
						"12" = "2";
						"13" = "3";
						"14" = "4";
						"15" = "5";
						"16" = "6";
					};
				};
					clock = {
						format = "{:%a %d %b | %H : %M}";
						tooltip = false;
					};

# -------------------------
			};
		};

		style = ''
		'';
	};
}

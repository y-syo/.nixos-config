{ pkgs, config, lib, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		#package = pkgs.unstable.hyprland;
		#systemd.enable = true;
		xwayland.enable = true;
		settings = {
			exec-once = "swww init";

			monitor = "eDP-1,1920x1080@144,0x0,1";

			env = "XCURSOR_SIZE,24";

			input = {
				kb_layout = "us";
				kb_variant = "intl";
				
				follow_mouse = "1";

				touchpad.natural_scroll = "no";
				
				sensitivity = "0";
				accel_profile = "flat";
			};

			general = {
				gaps_in = "4";
				gaps_out = "8";
				border_size = "2";
				"col.active_border"  = lib.mkForce "rgba(AC4142ff)";
				"col.inactive_border" = lib.mkForce "rgba(2b2b2b00)";
				layout = "dwindle";
				allow_tearing = "false";
			};

			decoration = {
				rounding = "5";
				drop_shadow = "no";
				blur = {
					enabled = "true";
					size =  "3";
					passes = "2";
					new_optimizations = "on";
				};
			};

			animations = {
				enabled = "yes";
				bezier = [
				"myBezier, 0.05, 0.9, 0.1, 1.05"
				"overshot, .29, .09, 0, 1"
				];
			};
			animation = [
				"windows, 1, 3, myBezier"
				"windowsOut, 1, 3, default, popin 80%"
				"border, 1, 3, default"
				"borderangle, 1, 3, default"
				"fade, 1, 3, default"
				"workspaces, 1, 3, overshot"
			];

			dwindle = {
				pseudotile = "yes";
				preserve_split = "yes";
			};

			gestures.workspace_swipe = "on";

			misc = {
				force_default_wallpaper = "-1";
				focus_on_activate = "true";
				initial_workspace_tracking = "2";
			};

			"$mainMod" = "SUPER";

			bind = [
			"$mainMod, Return, exec, kitty"
			"$mainMod, W, killactive"
			"$mainMod, M, exit"
			"$mainMod, E, exec, nemo"
			"$mainMod, Space, exec, tofi-drun --drun=true"
			"$mainMod, L, exec, swaylock"
			
			"$mainMod, left, movefocus, l"
			"$mainMod, right, movefocus, r"
			"$mainMod, up, movefocus, u"
			"$mainMod, down, movefocus, d"

			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"

			"$mainMod SHIFT, 1, movetoworkspace, 1"
			"$mainMod SHIFT, 2, movetoworkspace, 2"
			"$mainMod SHIFT, 3, movetoworkspace, 3"
			"$mainMod SHIFT, 4, movetoworkspace, 4"
			"$mainMod SHIFT, 5, movetoworkspace, 5"
			"$mainMod SHIFT, 6, movetoworkspace, 6"
			"$mainMod SHIFT, 7, movetoworkspace, 7"
			"$mainMod SHIFT, 8, movetoworkspace, 8"
			"$mainMod SHIFT, 9, movetoworkspace, 9"
			"$mainMod SHIFT, 0, movetoworkspace, 10"
			
			"$mainMod, S, exec, slurp | grim -g - - | wl-copy"
			"$mainMod, V, exec, wl-paste"
			];

			bindm = [
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
			];
		};
	};
}

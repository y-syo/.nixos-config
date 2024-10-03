{ pkgs, config, lib, inputs, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		#package = pkgs.unstable.hyprland;
		#systemd.enable = true;
		xwayland.enable = true;
		plugins = with inputs.sh-koh.packages.${pkgs.system} ; [
      hyprXPrimary
      hyprsplit
    ];
		settings = {
			exec-once = [
				"${pkgs.systemd}/bin/systemctl --user import-environment PATH"
				"${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
				"${pkgs.swww}/bin/swww init"
				"${pkgs.waybar}/bin/waybar"
	    ];

			monitor = [
				"eDP-1,1920x1080@144,0x0,1"
				"HDMI-A-1,1920x1080@74.99,auto,1"
			];

			workspace = [
				"1, monitor:eDP-1, default:true"
				"11, monitor:HDMI-A-1, default:true"
			];

			#env = "XCURSOR_SIZE,24";

			input = {
				kb_layout = "us";
				kb_variant = "intl";
				numlock_by_default = "true";
				
				follow_mouse = "1";

				sensitivity = "0";
				accel_profile = "flat";
				touchpad.natural_scroll = "no";
			};

			general = {
				gaps_in = "4";
				gaps_out = "8";
				border_size = "2";
				"col.active_border"  = lib.mkForce "rgba(f28779ff)";
				"col.inactive_border" = lib.mkForce "rgba(707a8cff)";
				layout = "dwindle";
				allow_tearing = "false";
			};

			decoration = {
				rounding = "0";
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
				disable_splash_rendering = "true";
				disable_hyprland_logo = "true";
				mouse_move_enables_dpms = "true";
				key_press_enables_dpms = "true";
				no_direct_scanout = "false";
				force_default_wallpaper = "-1";
				focus_on_activate = "true";
				initial_workspace_tracking = "2";
			};

			opengl = {
				nvidia_anti_flicker = "true";
				force_introspection = "1";
			};


			plugin = {
				xwaylandprimary = {
					display = "HDMI-A-1";
				};
			};

			"$mainMod" = "SUPER";

			bind =
			  let
			    layoutSwitcher = lib.getExe (
            pkgs.writeShellApplication {
              name = "layout-switcher.sh";
              runtimeInputs = with pkgs; [
                hyprland
                jq
              ];
              text = ''
                case $(hyprctl -j getoption general:layout | jq -r '.str') in 
                  "master") hyprctl keyword general:layout dwindle ;;
                  "dwindle") hyprctl keyword general:layout master ;;
                esac
              '';
            }
          );

          getActiveMonitor = lib.getExe (
            pkgs.writeShellApplication {
              name = "get-active-monitor.sh";
              runtimeInputs = with pkgs; [
                satty
                grim
                jq
                hyprland
              ];
              text = ''
                grim -o "$(hyprctl -j monitors all | \
                  jq -r '.[] | select(.focused == true) | .name')" - | \
                  satty --filename - \
                    --fullscreen \
                    --early-exit \
                    --copy-command "wl-copy" \
                    --initial-tool "crop"
              '';
            }
          );
		    in
			    [
			      "$mainMod, Return, exec, kitty"
			      "$mainMod, W, killactive"
			      "$mainMod CTRL SHIFT, M, exit"
			      "$mainMod, E, exec, nemo"
			      "$mainMod, Space, exec, tofi-drun --drun=true"
			      "$mainMod, L, exec, swaylock"
			      
			      "$mainMod, left, movefocus, l"
			      "$mainMod, right, movefocus, r"
			      "$mainMod, up, movefocus, u"
			      "$mainMod, down, movefocus, d"

			      "$mainMod, V, togglefloating,"
			      "$mainMod, F, fullscreen"

			      #"$mainMod, 1, workspace, 1"
			      #"$mainMod, 2, workspace, 2"
			      #"$mainMod, 3, workspace, 3"
			      #"$mainMod, 4, workspace, 4"
			      #"$mainMod, 5, workspace, 5"
			      #"$mainMod, 6, workspace, 6"
			      #"$mainMod, 7, workspace, 7"
			      #"$mainMod, 8, workspace, 8"
			      #"$mainMod, 9, workspace, 9"
			      #"$mainMod, 0, workspace, 10"

			      #"$mainMod SHIFT, 1, movetoworkspace, 1"
			      #"$mainMod SHIFT, 2, movetoworkspace, 2"
			      #"$mainMod SHIFT, 3, movetoworkspace, 3"
			      #"$mainMod SHIFT, 4, movetoworkspace, 4"
			      #"$mainMod SHIFT, 5, movetoworkspace, 5"
			      #"$mainMod SHIFT, 6, movetoworkspace, 6"
			      #"$mainMod SHIFT, 7, movetoworkspace, 7"
			      #"$mainMod SHIFT, 8, movetoworkspace, 8"
			      #"$mainMod SHIFT, 9, movetoworkspace, 9"
			      #"$mainMod SHIFT, 0, movetoworkspace, 10"
			      
			      "$mainMod, S, exec, slurp | grim -g - - | wl-copy"
			      "$mainMod, V, exec, wl-paste"
			    ] ++ (builtins.concatLists (
				    builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                    builtins.toString (x + 1 - (c * 10));
              in
                [
                  "$mainMod, ${ws}, split:workspace, ${toString (x + 1)}"
                  "$mainMod SHIFT, ${ws}, split:movetoworkspace, ${toString (x + 1)}"
                  "$mainMod CTRL, ${ws}, split:movetoworkspacesilent, ${toString (x + 1)}"
                ]
            ) 9
          ));

			bindm = [
			  "$mainMod, mouse:272, movewindow"
			  "$mainMod, mouse:273, resizewindow"
			];
		};
	};
}

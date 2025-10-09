{ config, inputs, pkgs, ... }:

{
	programs.zed-editor = {
		enable = true;
		package = null;

		extensions = [ "nix" "dockerfile" "rainbow-csv" ];
		#themes = [ ??? ];

		userSettings = {
			assistant = {
				enabled = false;
			};

			hour_format = "hour12";
			auto_update = false;
			terminal = {
				detect_venv = {
					on = {
						directories = [".env" "env" ".venv" "venv"];
						activate_script = "default";
					};
				};
				env = {
					TERM = "alacritty";
				};
				font_family = "Liga SFMono Nerd Font";
				line_height = "standard";
				minimum_contrast = "0";

				toolbar = {
					breadcrumbs = false;
				};
			};

			vim_mode = true;
			load_direnv = "shell_hook";
			#theme = {
			#	mode = "system";
			#	light = "Ayu Light";
			#	dark = "Ayu Mirage";
			#};
			theme = "Ayu Mirage";
			show_whitespaces = "all";
			#ui_font_family = "Liga SFMono Nerd Font";
			buffer_font_family = "Liga SFMono Nerd Font";
		};
	};
}

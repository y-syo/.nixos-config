{ config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        margin-top = 0;
        margin-bottom = 0;
        margin-right = 0;
        margin-left = 0;
        layer = "top";
        modules-left = [ "custom/distro" "custom/separator" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "mpris" "custom/prev" "custom/playpause" "custom/next" "custom/separator" "pulseaudio/slider" "custom/separator" "network" "battery" ];
        output = [ "HDMI-A-2" "HDMI-A-1" ]; #[ "eDP-1" "HDMI-A-1" ];

        "custom/separator" = {
          format =  "|";
          tooltip = false;
        };

        # ---------------------------------------------------------

        "custom/distro" = {
          #format = "";
          format = "";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
          "persistent-workspaces" = {
            "HDMI-A-1" = [ 1 2 3 4 5 6 ];
            "HDMI-A-2" = [ 11 12 13 14 15 16 ];
          };
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";

            "11" = "1";
            "12" = "2";
            "13" = "3";
            "14" = "4";
            "15" = "5";
            "16" = "6";
          };
        };

        # ---------------------------------------------------------

        clock = {
          format = "{:%a %d %b | %H : %M}";
          tooltip = false;
        };

        # ---------------------------------------------------------

        "custom/next" = {
          format =  "󰒭";
          on-click = "playerctl --player=spotifyd,spotify next";
          tooltip = false;
        };
        "custom/playpause" = {
          format =  "󰐊";
          on-click = "playerctl --player=spotifyd,spotify play-pause";
          tooltip = false;
        };
        "custom/prev" = {
          format =  "󰒮";
          on-click = "playerctl --player=spotifyd,spotify previous";
          tooltip = false;
        };
        mpris = {
          ignored-players = [ "firefox" ];
          format = "{player_icon} : {dynamic}";
          player-icons = {
            "spotify" = "";
            "spotifyd" = "";
          };
          title-len = 50;
          dynamic-len = 50;
          dynamic-order = [ "title" ];
          tooltip = false;
        };
        network = {
          #interface = "wlo1";
          format = "{ifname}";
          format-wifi = "{essid}";
          format-ethernet = "ethernet";
          format-disconnected = "no network";
          tooltip = false;
        };
        battery = {
          format = "{icon} {capacity} %";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = "󰂄 {capacity} %";
          tooltip = false;
        };

      };
    };

    style = ''
* {
  all: unset;
  font-family: "Liga SF Mono Nerd Font";
  font-size: 14px;
}

window#waybar {
  color: @base07;
  background: @base00;
  border-bottom: 2px solid @base04;
}

#custom-separator, #custom-distro, #workspaces, #custom-prev, #custom-playpause, #custom-next, #mpris, #battery, #network, #clock, #pulseaudio-slider {
  margin: 6px 4px;
  padding: 2px 8px;
}

#custom-separator {
	padding: 0px 4px;
}

#custom-distro {
  margin-left: 8px;
  padding: 0px 10px 0px 5px;
  font-size: 16px;
  color: @base09;
}

.modules-left #workspaces {padding: 0px;}
.modules-left #workspaces button {
  padding: 1px 6px;
}
.modules-left #workspaces button.empty {
  color: @base03;
}
.modules-left #workspaces button.visible {
  color: @base05;
}
.modules-left #workspaces button.active,
.modules-left #workspaces button.focused {
  padding: 1px 6px;
  color: @base09;
  border-color: transparent;
}
.modules-left #workspaces button.urgent {
  color: @base0E;
}

#custom-prev {
  margin-right: 0px;
  border-right: 0px;
}
#custom-playpause {
  margin-right: 0px;
  border-right: 0px;
  margin-left: 0px;
  border-left: 0px;
}
#custom-next {
  margin-left: 0px;
  border-left: 0px;
}

#pulseaudio-slider slider {
    min-height: 0px;
    min-width: 0px;
    opacity: 0;
    background-image: none;
    border: none;
    box-shadow: none;
}
#pulseaudio-slider trough {
    min-height: 8px;
    min-width: 50px;
    background-color: @base00;
}
#pulseaudio-slider highlight {
    min-width: 7px;
    background-color: @base09;
}

#network {
  padding: 2px 12px 2px 8px;
}

#network.disconnected {
  color: @base08;
}

#network.ethernet {
  color: @base0D;
}

#network.wifi {
  color: @base0B;
}

#battery {
  margin-right: 8px;
}

#battery.charging, #battery.plugged {
  color: @base0B;
}

#battery.critical:not(.charging) {
  color: @base08;
}
    '';
  };
}

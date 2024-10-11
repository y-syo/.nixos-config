{ config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        margin-top = 8;
        margin-bottom = 0;
        margin-right = 8;
        margin-left = 8;
        layer = "top";
        modules-left = [ "custom/distro" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "mpris" "pulseaudio/slider" "custom/prev" "custom/playpause" "custom/next" "network" "battery" ];
        output = [ "eDP-1" "HDMI-A-1" ];

        # ---------------------------------------------------------

        "custom/distro" = {
          format = "";
          #format = "";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
          "persistent-workspaces" = {
            "eDP-1" = [ 1 2 3 4 5 6 ];
            "HDMI-A-1" = [ 11 12 13 14 15 16 ];
          };
          format-icons = {
            "1" = "◆";
            "2" = "◆";
            "3" = "◆";
            "4" = "◆";
            "5" = "◆";
            "6" = "◆";

            "11" = "◆";
            "12" = "◆";
            "13" = "◆";
            "14" = "◆";
            "15" = "◆";
            "16" = "◆";
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
  font-family: "JetBrainsMono Nerd Font Mono";
  font-size: 14px;
}

window#waybar {
  color: #DCD7BA;
  background: @base00;
  border: 2px solid @base03;
}

#custom-distro, #workspaces, #custom-prev, #custom-playpause, #custom-next, #mpris, #battery, #network, #clock, #pulseaudio-slider {
  margin: 6px 4px;
  padding: 2px 8px;
  border-radius: 0px;
  background-color: @base01;
  border: 2px solid @base02;
}

#custom-distro {
  margin-left: 8px;
  padding: 0px 8px 0px 7px;
  font-size: 16px;
  color: @base08;
}

.modules-left #workspaces {padding: 0px;}
.modules-left #workspaces button {
  padding: 0px 4px;
  border-bottom: 0px solid transparent;
}
.modules-left #workspaces button.empty {
  color: @base03;
  border-bottom: 0px solid transparent;
}
.modules-left #workspaces button.visible {
  color: @base05;
  font-weight: 900;
  border-bottom: 0px solid transparent;
}
.modules-left #workspaces button.active,
.modules-left #workspaces button.focused {
  color: @base08;
  font-weight: 900;
  border-bottom: 3px solid transparent;
}
.modules-left #workspaces button.urgent {
  color: @base0E;
  font-weight: 900;
  border-bottom: 0px solid transparent;
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
    min-height: 7px;
    min-width: 50px;
    border-radius: 0px;
    background-color: @base00;
}
#pulseaudio-slider highlight {
    min-width: 7px;
    border-radius: 0px;
    background-color: @base08;
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

{ pkgs, config, lib, inputs, outputs, ... }:

{
  imports = [inputs.fht-compositor.homeModules.default];

  programs.fht-compositor = {
    enable = true;
    /*settings = {
      # Include cursor configuration from home environment
      cursor = {inherit (config.home.pointerCursor) name size;};

      # I mean, its really up to you...
      # You can also just do `builtins.fromTOML` if you have an existing config

    };*/
  };

  # Services that we setup as part of the desktop/graphical session.
  # They get all triggered when fht-compositor reaches the graphical.target
  # ---
  # You are **REALLY** recommended to use systemd services/units for your
  # autostart instead of configuring them with the autostart section, since you also get restart
  # on failure, logs, and all nice stuff.
  systemd.user.services = let
    start-with-graphical-session = Description: {
      Unit = {
        inherit Description;
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
        BindsTo = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Install.WantedBy = ["graphical-session.target" "fht-compositor.service"];
    };
  in {
    wallpaper =
      start-with-graphical-session "Wallpaper service"
      // {
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.swww}/bin/swww-daemon";
          Restart = "on-failure";
        };
      };

    # For my personally, I like having xwayland satellite to play games.
    # It works really fine, I already play non-native stuff fine. Though for other programs it may
    # not work as good, for example windows that need positionning
    xwayland-sattelite =
      start-with-graphical-session "Xwayland-satellite"
      // {
        Service = {
          Type = "notify";
          NotifyAccess = "all";
          ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
          StandardOutput = "journal";
        };
      };
  };
}

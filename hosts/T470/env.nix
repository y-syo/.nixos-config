{ pkgs, lib, config, inputs, outputs, ... }:

{
  environment = {
    sessionVariables = {
	  NIXOS_OZONE_WL = "1";
	  CLUTTER_BACKEND = "wayland";
	  KITTY_ENABLE_WAYLAND = "1";
	  MOZ_ENABLE_WAYLAND = "1";
	  MOZ_WEBRENDER = "1";
	  GDK_BACKEND = "wayland";
	  WLR_NO_HARDWARE_CURSOR = "1";
	};
  };


  time.timeZone = "Europe/Paris";

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ADRESS = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
      LC_ALL = "fr_FR.UTF-8";
      LANG = "fr_FR.UTF-8";
      LANGUAGE = "fr_FR.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
    # keyMap = "us";
  };
}

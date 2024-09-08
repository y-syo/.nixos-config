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
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADRESS = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
      LANGUAGE = "en_US.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
    # keyMap = "us";
  };
}

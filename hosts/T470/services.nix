{ pkgs, lib, config, inputs, outputs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    xserver = {
      layout = "us";
      xkbVariant = "intl";
      libinput = {
        enable = true;
        mouse.accelProfile = "flat";
      };
    };
    openssh.enable = true;
    fstrim.enable = true;
  };
}

{ pkgs, libs, config, inputs, outputs, ... }:

{
  networking = {
    hostName = "T470";
    networkmanager.enable = true;
    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };
}

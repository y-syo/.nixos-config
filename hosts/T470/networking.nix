{ pkgs, libs, config, inputs, outputs, ... }:

{
  networking = {
    hostName = "T470";
    networkmanager.enable = true;
    firewall = {
      enable = false;
      # allowedTCPPorts = [ 47984 47989 48010 ];
      # allowedUDPPorts = [ 47998 47999 48000 48002 48010 ];
    };
  };
}

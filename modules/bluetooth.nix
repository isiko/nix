{ pkgs, ... }:

{
  # Bluetooth Stuff
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    settings.general = {
      enable = "Source,Sink,Media,Socket";
    };
  };
}

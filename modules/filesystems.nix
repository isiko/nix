{config, pkgs, ...}:

{
  # Auto Mount USB-Sticks
  # HINT: You might need to create the "/media" directory
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.udisks2.mountOnMedia = true;

  environment.systemPackages = with pkgs; [
    exfat
  ];
}

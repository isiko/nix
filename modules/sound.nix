{config, pkgs, ...}:

{
  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  ## Dennis
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  # rtkit is optional but recommended
  # services.pipewire = {
  #   alsa.enable = true;
  #   alsa.support32Bit = true;

  #   enable = true;
  #   audio.enable = true;

  #   pulse.enable = true;

  #   wireplumber.enable = true;
  # };
  # sound.enable = false;

  ## Sound (Pipewire)
  ##sound.enable = false;
  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #  jack.enable = true;
  #};
  #hardware.pulseaudio.enable = false;
  ##systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];

  ## Sound (Pulseaudio - I don't use that any more :D )
  #hardware.pulseaudio = {
  #    enable = true;
  #    support32Bit = true;
  #    package = pkgs.pulseaudioFull;
  #    extraConfig = ''
  #      load-module module-combine-sink
  #      unload-module module-suspend-on-idle
  #    '';
  #};
  #nixpkgs.config.pulseaudio = true;

  # Sound (Pulseaudio - Old)
  #sound.enable = true;
  #hardware.pulseaudio = {
  #  enable = true;
  #  support32Bit = true;
  #  package = pkgs.pulseaudioFull;
  #};
  #nixpkgs.config.pulseaudio = true;
  #hardware.pulseaudio.extraConfig = "";
  #hardware.pulseaudio.configFile = pkgs.writeText "default.pa" ''
  #  load-module module-combine-sink
  #  load-module module-bluetooth-policy
  #  load-module module-bluetooth-discover
  #  ## module fails to load with 
  #  ##   module-bluez5-device.c: Failed to get device path from module arguments
  #  ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  #  # load-module module-bluez5-device
  #  # load-module module-bluez5-discover
  #'';
}

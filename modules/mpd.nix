{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/isiko404/Music";
    extraConfig = ''
        # must specify one or more outputs in order to play audio!
        # (e.g. ALSA, PulseAudio, PipeWire), see next sections
        audio_output {
          type "pipewire"
          name "MPD Pipewire Output"
        }
    '';

    # Optional:
    #network.listenAddress = "any"; # if you want to allow non-localhost connections
    #startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
  # TODO Move to Homemanger
  services.mpd.user = "isiko404";
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };
}

{
  # Networking
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;
  # Proxy (maby set that up in the future?
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    checkReversePath = false; # Needed for VPN stuff
    allowPing = false;
    allowedTCPPorts = [ 
      4444
      1312
      3000  # Mister X
      5173  # Mister X
      57621 # Spotify
      8384  # Syncthing
      22000 # Syncthing
      5037
    ];
    allowedUDPPorts = [
      4444
      1312
      5353  # Spotify
      3000  # Mister X
      5173  # Mister X
      22000 # Syncthing
      21027 # Syncthing
    ];
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
      { from = 5500; to = 5599; } # ADB
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
  networking.networkmanager.ensureProfiles.profiles = 
  let 
    interface = "wlp1s0";
  in 
  {
    "37C3" = {
      connection = {
        id = "37C3";
        type = "wifi";
        interface-name = interface;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "37C3";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        anonymous-identity = "37C3";
        eap = "ttls;";
        identity = "37C3";
        password = "37C3";
        phase2-auth = "mschapv2";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
    };
  };
}

{ pkgs, ... }:

{
  # Keyring
  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Yubikey
  environment.systemPackages = [ 
    pkgs.pcscliteWithPolkit.out
    pkgs.yubikey-manager
  ];
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.debian.pcsc-lite.access_pcsc" &&
            subject.isInGroup("wheel")) {
        return polkit.Result.YES;
        }
        });
  '';
  services.pcscd = {
    enable = true;
    plugins = [ pkgs.ccid ];
  };
  hardware.gpgSmartcards.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];

  # Fingerprint
  services.fprintd = {
    enable = true;
    tod = {
      enable = false;
      driver = pkgs.libfprint-2-tod1-vfs0090;
    };
  };

  security.pam.services = {
    login = {
      fprintAuth = false;
      u2fAuth = false;
      enableGnomeKeyring = true;
    };
    swaylock = {
      fprintAuth = false;
      u2fAuth = false;
      enableGnomeKeyring = true;
    };
    sudo = {
      fprintAuth = true;
      u2fAuth = true;
    };
  };

}

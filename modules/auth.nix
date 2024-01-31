{ pkgs, ... }:

{
  # Keyring
  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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

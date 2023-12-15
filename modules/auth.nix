{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.udev.packages = [ pkgs.yubikey-personalization ];

  services.fprintd = {
    enable = true;
    tod = {
      enable = false;
      driver = pkgs.libfprint-2-tod1-vfs0090;
    };
  };

  security.pam.services = {
    login = {
      # fprintAuth = true;
      # u2fAuth = true;
      enableGnomeKeyring = true;
    };
    sudo = {
      fprintAuth = true;
      u2fAuth = true;
    };
  };
}

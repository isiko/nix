# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let
  modules = {
    default = [
      <home-manager/nixos>
      #<nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
      #<nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      ./users/setup.nix
      ./modules/packages.nix

      ./modules/docker.nix
      ./modules/networking.nix
      ./modules/restic.nix
      ./modules/syncthing.nix
    ];
    desktop = [
      ./modules/auth.nix
      ./modules/bluetooth.nix
      ./modules/desktop.nix
      ./modules/fonts.nix
      ./modules/locale.nix
      ./modules/mpd.nix
      ./modules/sound.nix
      ./modules/steam.nix
      #./modules/sway.nix
      #./modules/tlp.nix
      #./modules/yubikey.nix # Just for editing
    ];
    server = [
      #./modules/postgresql.nix
    ];
  };
  hosts = {
    laptop = modules.default ++ modules.desktop ++ [ ];
  };
in
{
  imports = hosts.laptop ++ [
    ./modules/hardware-config/laptop.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  hardware.gpgSmartcards.enable = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  programs.ssh = {
      forwardX11 = true;
  };

  programs.java.enable = true;
  services.upower.enable = true;
}

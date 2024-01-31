# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let
  # unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    ./users/setup.nix
    ./modules/hardware-configuration.nix 
    ./modules/bluetooth.nix
    ./modules/bootloader.nix
    ./modules/desktop.nix
    ./modules/auth.nix
    ./modules/locale.nix
    ./modules/mpd.nix
    ./modules/networking.nix
    ./modules/packages.nix
    #./modules/postgresql.nix
    ./modules/sound.nix
    #./modules/sway.nix
    ./modules/syncthing.nix
    ./modules/tlp.nix
    ./modules/docker.nix
    ./modules/restic.nix
    ./modules/steam.nix
    ./modules/fonts.nix
    ./modules/yubikey.nix
    <home-manager/nixos>
  ]; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

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

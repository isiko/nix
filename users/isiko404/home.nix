{ config, pkgs, lib, ... }:

# [x] Git Signing setup

let
  vars = import ./vars.nix;
in
{
  home.username = "isiko404";
  home.homeDirectory = "/home/isiko404";

  imports = [
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/kanshi.nix
    ./modules/sshAgent.nix
    ./modules/waybar.nix
    ./modules/gtk.nix
    ./modules/hyprland.nix
    ./modules/email.nix
    ./modules/helix.nix
    ./modules/mako.nix
    ./modules/swaylock.nix
    ./modules/alacritty.nix
    ./modules/kdeconnect.nix
    ./modules/wofi.nix
    ./modules/hyprlock.nix
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.nordzy-cursor-theme
  ];

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/isiko404/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "proc cpu mem net";
      update_ms = 2000;
      proc_tree = true;
      proc_gradient = false;
      cpu_single_graph = true;
      clock_format = "%H:%M - %d.%m.%y";
      net_download = 1000;
      net_upload = 1000;
      selected_battery = "BAT0";
    };
  };

 #wayland.windowManager.sway = {
 #  enable = true;
 #  config = rec {
 #    modifier = "Mod4";
 #    terminal = "alacritty";
 #  };
 #};

}

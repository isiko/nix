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

  programs.eclipse = {
    enable = true;
    package = pkgs.eclipses.eclipse-java;
    plugins = [
      (pkgs.eclipses.plugins.buildEclipseUpdateSite rec {
         name = "programming-lecture-eclipse-artemis-${version}";
         version = "4.8.6";

         src = pkgs.fetchFromGitHub {
           owner = "kit-sdq";
           repo = "programming-lecture-eclipse-artemis";
           rev = "b92d70c5e81b71db47ba18a32c8b99bc07a93d52";
           hash = "sha256-7LEx/AfIsyqzwjqH6VTg14MnsLyrnbkRTJoQ/Hr7L9A=";
         };

         meta = with lib; {
           homepage = "https://github.com/kit-sdq/programming-lecture-eclipse-artemis";
           description = "Eclipse-Plugin for grading with the artemis project";
           sourceProvenance = with sourceTypes; [binaryBytecode];
           license = licenses.epl20;
           platforms = platforms.all;
         };
       })
    ];
  };

 #wayland.windowManager.sway = {
 #  enable = true;
 #  config = rec {
 #    modifier = "Mod4";
 #    terminal = "alacritty";
 #  };
 #};

}

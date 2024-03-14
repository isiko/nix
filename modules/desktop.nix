{pkgs, ... }:

{
  # XDG Portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  xdg.portal.configPackages = [ pkgs.xdg-desktop-portal-hyprland ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #enableNvidiaPatches = true;
  };

  nixpkgs.overlays = [
   (self: super: {
     waybar = super.waybar.overrideAttrs (oldAttrs: {
       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     });
   })
  ];

  #services.xserver.disGreyplayManager.gdm = {
  #  enable = true;
  #  wayland = true;
  #};
  #services.greetd = {
  #  enable = true;
  #  settings = {
  #  default_session.command = ''
  #   ${pkgs.greetd.tuigreet}/bin/tuigreet \
  #     --time \
  #     --asterisks \
  #     --user-menu \
  #     --cmd Hyprland
  #     -r
  #  '';
  #  };
  #};

  #environment.etc."greetd/environments".text = ''
  #  Hyprland
  #'';

  # Gnome
  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
}

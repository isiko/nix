{ config, pkgs, ... }:

let 
  isiko-imp = import ./isiko404/user.nix;
  isiko404 = {
    home = import ./isiko404/home.nix;
    global = isiko-imp;
    #global = isiko-loc;
  };
in
{
  # Defaults
  users.defaultUserShell = pkgs.zsh;

  # Users
  home-manager.users.isiko404 	= isiko404.home;
  users.users.isiko404 		= {
     isNormalUser = true;
     description = "Isaak";
     extraGroups = [ "networkmanager" "wheel" "audio" "pipewire"];
     shell = pkgs.zsh;
     packages = with pkgs; [];
  };
  #services.getty.autologinUser = "isiko404";
}

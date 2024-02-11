{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = 
    let
      modules = {
        default = [
          ./configuration.nix
            ./users/setup.nix
            ./modules/packages.nix

            ./modules/docker.nix
            ./modules/networking.nix
            ./modules/restic.nix
            ./modules/syncthing.nix
        ];
        desktop-environment = [
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
        home-manager = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.isiko404 = import ./users/isiko404/home.nix;
          }
        ];
      };
      mkHost = {
        name, 
        customModules ? []
      }: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = 
          customModules ++ 
          modules.default ++
          modules.desktop-environment ++
          modules.home-manager ++ 
          [
            ./modules/hardware-config/${name}.nix
          ];
      };
    in
    {
      laptop = mkHost {
        name = "laptop";
      };
      desktop = mkHost {
        name = "desktop";
      };
      iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ]
        ++ modules.default
        ++ modules.desktop-environment
        ++ modules.home-manager;
      };
    };
  };
}
#{
#  description = "Setup for the Machines of isiko404";
#
#  inputs = {
#    nixpkgs = {
#      url = "github:NixOS/nixpkgs/nixos-unstable";
#    };
#    home-manager.url = "github:nix-community/home-manager";
#    home-manager.inputs.nixpkgs.follows = "nixpkgs";
#  };
#
#  outputs = inputs@{nixpkgs, home-manager, ...}: {
#    nixosConfigurations = 
#      let 
#        isiko404 = {
#          home = import ./isiko404/home.nix;
#          global = import ./isiko404/user.nix;
#        };
#      in
#    {
#      laptop = nixpkgs.lib.nixosSystem {
#        system = "x86_64-linux";
#        modules = [
#          ./configuration.nix
#
#          home-manager.nixosModules.home-manager
#          {
#            home-manager.useGlobalPkgs = true;
#            home-manager.useUserPackages = true;
#            home-manager.users.isiko404 	= isiko404.home;
#          }
#        ];
#      };
#    };
#  };
#}
#

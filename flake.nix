{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.isiko404 = import ./users/isiko404/home.nix;
          }
        ];
      };
      iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.isiko404 = import ./users/isiko404/home.nix;
          }
        ];
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

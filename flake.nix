{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = 
    (import ./util/hosts.nix { nixpkgs = nixpkgs; home-manager = home-manager; }).sysConfigs //
    {
        # Custom Config here
    };
  };
}

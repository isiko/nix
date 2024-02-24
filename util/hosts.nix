{inputs}:

let 
    modules = {
       default = [
           ../modules/docker.nix
           ../modules/networking.nix
           ../modules/restic.nix
           ../modules/syncthing.nix
       ];
       desktop-environment = [
           ../modules/auth.nix
           ../modules/bluetooth.nix
           ../modules/desktop.nix
           ../modules/fonts.nix
           ../modules/locale.nix
           ../modules/mpd.nix
           ../modules/sound.nix
           ../modules/steam.nix
           #../modules/sway.nix
           #../modules/tlp.nix
           #../modules/yubikey.nix # Just for editing
       ];
       server = [
           #../modules/postgresql.nix
       ];
       home-manager = [
           inputs.home-manager.nixosModules.home-manager
           {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users.isiko404 = import ../users/isiko404/home.nix;
           }
       ];
   };
    mkHost = {name, cores,  customModules ? []}: inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit name;
            inherit customModules;
            inherit cores;

            inherit inputs;
        };
        modules = 
            customModules ++ 
            modules.default ++
            modules.desktop-environment ++
            modules.home-manager ++ 
            [
                ../configuration.nix
                ../users/setup.nix
                ../modules/packages.nix
                ../modules/filesystems.nix
                ../hosts/${name}.nix
            ];
    };
in
{
    sysConfigs = builtins.listToAttrs (
            builtins.map (h: {
                name = h.name;
                value = (mkHost (h));
            }) (import ../hosts/hostList.nix)
       );
}

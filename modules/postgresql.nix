{ pkgs, ... }:

{
  services.postgresql = {
    package = pkgs.postgresql_15;
    enable = true;
    initdbArgs = [
      "--locale=de_DE.UTF-8"
    ];
    ensureDatabases = [ "isiko404" ];
    ensureUsers = [ 
      { 
        name = "isiko404"; 
        ensureClauses.superuser = true;
      } 
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      host all all ::1/128 trust
    '';
    settings = {
      ##lc_monetary = "de_DE.UTF-8 UTF-8";
    };
  };
}

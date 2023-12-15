{config, pkgs, ... }:

{
  # Keys currently have to be added manually with the following command:
  # ssh-add ~/.ssh/id_<keyname> 
  # services.ssh-agent.enable = true;
  services.gpg-agent = {
      enable = true;
      enableExtraSocket = true;
      enableSshSupport = true;
      maxCacheTtl = 60 * 60 * 24;
      defaultCacheTtl = 60 * 60 * 24;
      defaultCacheTtlSsh = 60 * 60 * 24;
  };
  services.gnome-keyring = {
      enable = true;
      components = [ "ssh" ];
  };
}

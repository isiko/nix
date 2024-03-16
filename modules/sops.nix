{name, ...}:

{
  sops.defaultSopsFile = ../secrets/isiko404.yaml;
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  sops.secrets."restic/machines/${name}" = {};
  sops.secrets."restic/ssh-key" = {};
}

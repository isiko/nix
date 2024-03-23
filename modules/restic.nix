{config, pkgs, name, ...}: 

{
  services.restic = {
    backups = {
      kobert = {
        paths = [
          "/home"
          "/etc/nixos"
        ];
        exclude = [
          "/home/*/.cache"
          "/home/*/.ssh/id_*"
          "/etc/nixos/secrets"
          "*.sync-conflict-*"
        ];
        initialize = true;
        passwordFile = config.sops.secrets."restic/machines/${name}".path;
        repository = "sftp:backup-kobert:/mnt/lts/isiko_backup/${name}";
        timerConfig = {
          OnCalendar = "*-*-* *:00:00";
          Persistent = true;
        };
        extraOptions = [
          "sftp.command='ssh isiko404@kobert.dev -p 222 -i ${config.sops.secrets."restic/ssh-key".path} -s sftp'"
        ];
        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 5"
          "--keep-monthly 12"
          "--keep-yearly 75"
        ];
      };
    };
  };
}

{config, pkgs, ...}: 

{
  services.restic = {
    backups = {
      kobert = {
        #user = "isiko404";
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
        passwordFile = "/etc/nixos/secrets/restic-password";
        repository = "sftp:backup-kobert:/mnt/lts/isiko_backup/laptop";
        timerConfig = {
          OnCalendar = "*-*-* *:00:00";
          Persistent = true;
        };
        extraOptions = [
          "sftp.command='ssh isiko404@kobert.dev -p 222 -i /home/isiko404/.ssh/id_backups -s sftp'"
        ];
        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 5"
          "--keep-monthly 12"
          "--keep-yearly 75"
        ];
        # backupPrepareCommand = "notify-send 'Backup started' 'Starting remote-backup at kobert.dev'";
        # backupCleanupCommand = "notify-send 'Cleanup started' 'Starting cleanup of remote-backup at kobert.dev'";
      };
    };
  };
}

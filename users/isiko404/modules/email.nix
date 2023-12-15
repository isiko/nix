{pkgs, ...}:

let 
emailConfig = import ./email/config.nix;
in
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-bin;
    settings = {
      "mail.identity.default.fcc_reply_follows_parent" = true;
    };
    profiles = {
      "Full" = {
        isDefault = true;
        # settings = {};
        withExternalGnupg = false;
      };
      "KIT" = {
        isDefault = false;
        # settings = {};
        withExternalGnupg = false;
      };
      "Personal" = {
        isDefault = false;
        # settings = {};
        withExternalGnupg = false;
      };
      "Info-AG" = {
        isDefault = false;
        # settings = {};
        withExternalGnupg = false;
      };
    };
  };
  accounts.email = emailConfig;
}

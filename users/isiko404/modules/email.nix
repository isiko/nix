{pkgs, ...}:

let 
emailConfig = import ./email/config.nix;
in
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-bin;
    settings = {
      "mail.identity.default.compose_html" = false;

      "mail.identity.default.fcc_reply_follows_parent" = true;
      "mail.identity.default.suppress_signature_separator" = true; # Removes the two dashes before the signature

      "mail.identity.default.reply_on_top" = 1;
      "mail.identity.default.sig_bottom" = false;

      "mail.identity.default.sig_mail" = true;
      "mail.identity.default.sig_on_fwd" = true;
      "mail.identity.default.sig_on_reply" = true;
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

let 
    isiko404 = {
        flavor = "plain";
        imap = {
            host = "mail.isiko404.dev";
            port = 993;
        };
        smtp = {
            host = "mail.isiko404.dev";
            port = 465;
        };
    };
    Google = {
        flavor = "gmail.com";
        imap = {
            host = "imap.gmail.com";
            port = 993;
        };
        smtp = {
            host = "smtp.gmail.com";
            port = 587;
        };
    };
    KIT = {
        flavor = "plain";
        imap = {
            host = "imap.kit.edu";
            port = 993;
        };
        smtp = {
            host = "smtp.kit.edu";
            port = 587;
            tls = {
                useStartTls = true;
            };
        };
    };
    KIT-FSMI = {
        flavor = "plain";
        smtp = {
            host = "fsmi-mail.fsmi.uni-karlsruhe.de";
            port = 587;
            tls = {
                useStartTls = true;
            };
        };
    };
    strato = {
        flavor = "plain";
        imap = {
            host = "imap.strato.de";
            port = 993;
        };
        smtp = {
            host = "smtp.strato.de";
            port = 465;
        };
    };
    name = {
        full = "Isaak Körner";
        nick = "isiko404";
    };
    signature = {
        generator = official : nick : lang: {
            showSignature = "append";
            delimiter = ''
                          --
                        '';
            text = ''
                ${
                    if official then
                        if lang == "en" then "Sincerly"
                        else "Mit Freundlichen Grüßen"
                    else
                        if lang == "en" then "Cheers"
                        else "Hau rein"
                }
                ${if nick then name.nick else name.full}
                Website:\t https://isiko404.dev
                E-Mail: \t mail@isiko404.dev
                '';
        };
    };
in
{
    accounts = {
        "isiko404.dev @ Main" = {
            address = "mail@isiko404.dev";
            primary = false;

            userName = "mail@isiko404.dev";

            flavor = isiko404.flavor;
            imap = isiko404.imap;
            smtp = isiko404.smtp;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        "isiko404.dev @ Official" = {
            address = "info@isiko404.dev";
            primary = false;

            userName = "info@isiko404.dev";

            flavor = isiko404.flavor;
            imap = isiko404.imap;
            smtp = isiko404.smtp;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        "isiko404.dev @ Spam" = {
            address = "nim@isiko404.dev";
            primary = false;

            userName = "nim@isiko404.dev";

            flavor = isiko404.flavor;
            imap = isiko404.imap;
            smtp = isiko404.smtp;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        # Warning: The SMTP Server for the Aliases has to be set manually
        "KIT @ Main" = {
            address = "uyjjh@student.kit.edu";
            primary = true;

            aliases = [ 
                "isaak.koerner@student.kit.edu"
                "isaak.koerner@fsmi.uni-karlsruhe.de"
            ];

            userName = "uyjjh@student.kit.edu";

            flavor = KIT.flavor;
            imap = KIT.imap;
            smtp = KIT.smtp;

            realName = name.full;
            signature = {
                showSignature = "append";
                text = "TEST SIGNATURE HOME";
            };
            thunderbird = {
                enable = true;
                profiles = [ "KIT" "Full" ];
            };
        };

        "KIT-FSMI @ Personal" = {
            address = "isaak.koerner@fsmi.uni-karlsruhe.de";
            primary = false;

            userName = "isaak.koerner";

            flavor = KIT-FSMI.flavor;
            smtp = KIT-FSMI.smtp;

            realName = name.full;
            signature = signature.generator true false "de";
            thunderbird = {
                enable = true;
                profiles = [ "KIT" "Full" ];
            };
        };

        "InfoAG @ Personal" = {
            address = "koerner@informatik-ag.net";
            primary = false;

            userName = "koerner@informatik-ag.net";

            flavor = strato.flavor;
            imap = strato.imap;
            smtp = strato.smtp;

            realName = name.full;
            signature = signature.generator true false "de";
            thunderbird = {
                enable = true;
                profiles = [ "Info-AG" "Full" ];
            };
        };

        "InfoAG @ Main" = {
            address = "info@informatik-ag.net";
            primary = false;

            userName = "info@informatik-ag.net";

            flavor = strato.flavor;
            imap = strato.imap;
            smtp = strato.smtp;

            realName = name.full;
            signature = signature.generator true false "de";
            thunderbird = {
                enable = true;
                profiles = [ "Info-AG" "Full" ];
            };
        };

        "Google @ Main" = {
            address = "isihd.ko@gmail.com";
            primary = false;

            userName = "isihd.ko@gmail.com";

            flavor = Google.flavor;
            #smtp = Google.smtp;
            #imap = Google.imap;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        "Google @ Personal" = {
            address = "isaak.koerner@gmail.com";
            primary = false;

            userName = "isaak.koerner@gmail.com";

            flavor = Google.flavor;
            #smtp = Google.smtp;
            #imap = Google.imap;

            realName = name.full;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        "Google @ Error (isidh.ko)" = {
            address = "isidh.ko@gmail.com";
            primary = false;

            userName = "isidh.ko@gmail.com";

            flavor = Google.flavor;
            #smtp = Google.smtp;
            #imap = Google.imap;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };

        "Google @ Error (isikd.ko)" = {
            address = "isikd.ko@gmail.com";
            primary = false;

            userName = "isikd.ko@gmail.com";

            flavor = Google.flavor;
            #smtp = Google.smtp;
            #imap = Google.imap;

            realName = name.nick;
            signature = signature.generator true true "en";
            thunderbird = {
                enable = true;
                profiles = [ "Personal" "Full" ];
            };
        };
    };
}

# "InfoAG @ Personal" = {
#   address = "koerner@informatik-ag.net";
#   aliases = [ ];
#   flavor = "plain";
#   folders = {
#       # draft = "";
#       # inbox = "";
#       # sent = "";
#       # trash = "";
#   };
#   gpg = {
#       encryptByDefault = false;
#       key = "";
#       signByDefault = true;
#   };
#   imap = {
#       host = "imap.strato.de";
#       port = 993;
#       tls = {
#           enable = true;
#           useStartTls = false;
#       };
#   };
#   smtp = {
#       host = "smtp.strato.de";
#       port = 465;
#       tls = {
#           enable = true;
#           useStartTls = false;
#       };
#   };
# 
#   userName = "koerner@informatik-ag.net";
#   # passwordCommand = ""; # A Command that outputs the account Password
# 
#   primary = true;
#   realName = "Isaak Körner";
#   signature = {
#       # command = ""; # Should output the current Signature
#       text = ''
#       Mit Freundlichen Grüßen
#       Isaak Körner
#       '';
#       delimiter = "  --"; # Seperates the Signature from the Rest of the Mail
#       showSignature = "none";
#   };
#   thunderbird = {
#       enable = true;
#       profiles = [ ]; # For which Profiles the account should be enabled ( empty = all )
#   };
# };

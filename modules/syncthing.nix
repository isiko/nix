{pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "isiko404";
    dataDir = "/home/isiko404/";
    configDir = "/home/isiko404/.config/syncthing";
    package = pkgs.syncthing;
    openDefaultPorts = true;

    # tray.enable = true;

    # Devices
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any devices added or deleted through the WebUI

    settings = {
      gui = {
        theme = "black";
        #user = "isiko404";
        #password = "";
      };
      devices = {
        "Desktop" = { id = "N5U7SUD-XOHFNZE-CKNLYD2-MV77SD4-UY2HJ5G-TA363NJ-6KHKLYO-UDWLKQB"; };
        "Mobil" = { id = "FYNN2AW-DBNHWLT-HX5EJXM-TVX7646-BTA76M4-GZ4BZ4Z-2J35IWK-3WTDVA5"; };
        "S1" = { id = "CEUYDWO-PXTS5O4-QKHLSJX-X7MYSUN-OVEZSFG-VUG6ZY2-ORQVXJO-BPN7HQV"; };
        "S2" = { id = "XM2ZHD4-FPJVSKM-YVQBI74-JPK4AFS-3OAWHWC-YEYHGFI-EMOBPUB-UFDEAAD"; };
        "S3" = { id = "XYVAJKV-CJLQQMR-SCN5YVZ-H44MA34-RRV5LHS-U3CIBJW-JOR662Y-GBREYQN"; };
        "Laptop - Joshua" = { id = "DZEPOUQ-PDA7Z2U-LPBDLNZ-MB2WB3R-3BGCEKN-CO43HWK-PBDPAO7-L2QNIQV"; };
      };
      folders = {
        "Default Folder" = {
          id = "default";
          path = "/home/isiko404/Sync";
          devices = [ 
            "Desktop"
            "S1"
            "S2"
            "S3"
          ];
        };
        "Private" = {
          id = "scvdr-vndaa";
          path = "/home/isiko404/Private";
          devices = [ 
            "Desktop"
            "S1"
            #"S2"
            "S3"
          ];
        };
        "Documents" = {
            id = "pm4wv-es4jj";
            path = "/home/isiko404/Documents";
            devices = [ 
              "Desktop"
              "S3"
            ];
        };
        "Bilder" = {
            id = "8xpvr-x8exg";
            path = "/home/isiko404/Pictures";
            devices = [ 
             "Desktop" 
             "S3"
            ];
        };
        "Keepass" = {
          id = "pgceo-647dn";
          path = "/home/isiko404/KeePass";
          devices = [ 
            "Desktop"
            "S1"
            "S2"
            "S3"
            "Mobil"
          ];
        };
        "Github" = {
          id = "qvs2u-vrrdt";
          path = "/home/isiko404/Github";
          devices = [ 
            "Desktop"
            "S1"
            "S3"
          ];
        };
        #"Dotfiles" = {
        #    id = "jetad-yluee";
        #    path = "/home/isiko404/.config";
        #    devices = [ 
        #      "Desktop"
        #      "S1"
        #      "S2"
        #      "S3"
        #    ];
        #};
        #"SSH-Config" = {
        #    id = "7estq-fvxf3";
        #    path = "/home/isiko404/.ssh";
        #    devices = [ 
        #      "Desktop"
        #      "S1"
        #      "S3"
        #    ];
        #};
        "Joshua Share" = {
          id = "eqnrc-hu2ks";
          path = "/home/isiko404/syncthing/Joshua/Share";
          devices = [ 
            "Laptop - Joshua"
            "S1"
            "S3"
          ];
        };
      };
    };

  };
}

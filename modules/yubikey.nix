{config, pkgs, ...}:

{
  environment.systemPackages = [ 
    pkgs.pcscliteWithPolkit.out
    pkgs.yubikey-manager
  ];

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.debian.pcsc-lite.access_pcsc" &&
            subject.isInGroup("wheel")) {
        return polkit.Result.YES;
        }
        });
  '';

  services.pcscd = {
    enable = true;
    plugins = [ pkgs.ccid ];
  };

  services.udev.packages = [ pkgs.yubikey-personalization ];
}

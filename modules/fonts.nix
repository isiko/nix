{config, pkgs, ...}:

{
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "Inconsolata" ]; })
      font-awesome
      mona-sans
      fira-mono
      fira-code
    ];
  };
}

{ pkgs, ...}:
let 
  getFrom = url: hash: name: {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    size = 48;
    package = 
      pkgs.runCommand "moveUp" {} ''
      mkdir -p $out/share/icons
      ln -s ${fetchTarball {
        url = url;
        hash = hash;
      }} $out/share/icons/${name}
    '';
    };
  in

{
  # home.pointerCursor = {
  #   name = "Bibata-Modern-Classic";
  #   package = pkgs.bibata-cursors;
  #   size = 16;
  #   gtk.enable = true;
  # };

  #home.pointerCursor = {
  #  name = "Nordzy-cursors";
  #  package = pkgs.nordzy-cursor-theme;
  #  size = 16;
  #  gtk.enable = true;
  #};

  home.pointerCursor = {
    name = "vanilla-dmz";
    package = pkgs.vanilla-dmz;
    size = 16;
    gtk.enable = true;
  };

  #home.pointerCursor = getFrom 
  #  "https://git.sr.ht/~ainola/pixelfun2/refs/download/v6/pixelfun2-monochrome-v6.tar.gz"
  #  "sha256:7b95e746f9953a236b29cc2c8854d704f2f68aea46524694fa612745d1d1a923"
  #  "pixelfun2-monochrome";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Catppuccin
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };
  };
}

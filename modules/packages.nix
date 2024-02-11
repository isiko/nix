{ pkgs, ... }:

let 
  #unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Wacom Tablet
  services.xserver.wacom.enable = true;
  hardware.opentabletdriver.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # Packages
  # Search like this: nix search <PackageName>
  environment.systemPackages = with pkgs; [
    home-manager

    # Compilers and Programming stuff
    #rustup
    # cargo
    # rustc
    jdk21
    jdk17

    # Not shure if this is needed anymore, remove in next purge
    nodejs # Needed for Copilot
    #yarn
    #gcc
    #pkg-config
    gnumake
    
    # Latex
    texlab
    tectonic
    texlive.combined.scheme-full

    # Neovim 
    neovim
    lua-language-server
    rust-analyzer

    # Small Tools (mostly CLI)
    tree
    ripgrep
    speedtest-cli
    rcon
    usbutils
    sshfs
    watchexec
    ffmpeg
    id3v2
    graphviz
    nix-du
    z-lua
    nmap
    unzip
    zip
    wget
    htop
    btop
    git
    dig 
    pferd
    mtr
    grim
    slurp
    file
    tmux
    iftop
    mpd

    # Some more cool stuff :D
    cmatrix
    cowsay
    nms       # Text-Apearing Effect
    neofetch
    figlet
    timer
    sl
    cava      # Audio Visualizer
    cavalier  # Audio Visualizer

    # Moderne Linux Kommandozeilenwerkzeuge
    xsv         # CSV Tool
    choose
    gron        # Grep-able JSON
    sd          # Find and replace / Search and replace
    map-cmd     # Run a command for a lot of files
    q           # DNS
    gping       # Graphical Ping
    ioping      # Disk metrics
    duf         # Disk usage
    du-dust     # Disk usage "dust"
    hyperfine   # Speed comparison between CMDs
    procs       # PS replacement
    viu         # Images in der CMD
    hexyl       # Hexviewer
    glow        # Markdown renderer in der cmd
    fd
    progress
    ranger
    bat  
    fx          # JSON viewer
    skim
    fzf

    # Jetbrains
    jetbrains-toolbox
    jetbrains.idea-ultimate
    jetbrains.datagrip
    #jetbrains.rust-rover
    android-studio

    # Desktop Programs
    scribus
    feh
    wl-mirror
    gimp
    telegram-desktop
    inkscape
    vscode
    vlc
    libvlc
    gnome.gnome-calculator
    zathura
    audacity
    fluffychat
    element-desktop
    spotify
    keepassxc
    firefox
    signal-desktop
    obsidian
    gnome.nautilus
    gnome.sushi # Some stuff for nautilus
    rnote
    #discord-canary # The normal discord package didn't work for me, it would always log me out. I'll maby switch back in the future
    google-chrome
    libreoffice
    networkmanagerapplet

    # Games
    mindustry-wayland
    minecraft

    # Terminals
    alacritty
    kitty

    # Some Background tools
    brightnessctl
    playerctl
    wofi
    swaybg
    wl-clipboard
    libnotify
    pciutils
    xdg-utils
    iio-sensor-proxy
    upower
    hyprpicker

    # Keyring
    gcr
    gnupg # Mostly for ssh
  ];

}

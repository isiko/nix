{ pkgs, ... }:

let 
  #unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Packages
  # Search like this: nix search <PackageName>
  environment.systemPackages = with pkgs; [
    home-manager

    # Theming
    #nordzy-cursor-theme

    # Compilers and Programming stuff
    #rustup
    # cargo
    # rustc
    nodejs
    yarn
    gcc
    pkg-config
    gnumake
    jdk21
    jdk17
    
    wineWowPackages.stable
    
    # Latex
    texlab
    tectonic
    texlive.combined.scheme-full

    # Neovim 
    neovim
    lua-language-server
    rust-analyzer
    neovide
    ripgrep

    # Small Tools (mostly CLI)
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
    hub
    dig 
    pferd
    mtr
    grim
    slurp
    file
    tmux
    #busybox
    iftop
    mpd

    todoist
    ##planify

    # Some more cool stuff :D
    cmatrix
    cowsay
    neofetch
    figlet
    nms
    timer
    peaclock
    tty-clock
    sl

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
    #thefuck     # Correction for Commands
#    xxh  # Local Shell Config on remote mashines?
#    oh-my-posh # Shell Theming?
    fd
    progress
    lynis
    wtf
    ranger

    ## better cat
    bat  
    #ccat
    fx          # JSON viewer
    ## Diffs
    delta
    diff-so-fancy
    dyff
    ## FuzzyFinder
    skim
    fzf

    # Desktop Programs
    feh
    wl-mirror
    gimp
    telegram-desktop
    onthespot
    thunderbird
    #jetbrains-toolbox
    android-studio
    jetbrains.idea-ultimate
    #jetbrains.rust-rover
    jetbrains.datagrip
    gnome.gnome-calendar
    #teams-for-linux
    inkscape
    vscode
    vlc
    libvlc
    feh
    gnome.gnome-calculator
    zathura
    audacity
    fluffychat
    element-desktop
    spotify
    keepassxc
    firefox
    signal-desktop
    #obsidian
    gnome.nautilus
    gnome.sushi # Some stuff for nautilus
    rnote
    discord-canary # The normal discord package didn't work for me, it would always log me out. I'll maby switch back in the future
    google-chrome
    libreoffice
    networkmanagerapplet

    slides # Terminal Presentation Tool

    # Games
    mindustry-wayland
    minecraft

    # Terminals
    alacritty
    kitty

    # Some Background tools
    #fprintd
    brightnessctl
    playerctl
    wofi
    swaybg
    wl-clipboard
    dunst
    libnotify
    pciutils
    xdg-utils
    iio-sensor-proxy
    upower
    hyprpicker
    #wpaperd
    #fprintd

    # Pulseaudio
    #pulseaudio
    #pamixer
    pavucontrol
    alsa-utils
    
    # Other Audio stuff
    #pwvucontrol
    #qpwgraph
    #qjackctl

    # Currently just testing this
    libsForQt5.kdeconnect-kde

    # Keyring
    gcr
    gnupg # Mostly for ssh
    frp

    #(steam.override {
    #   withPrimus = true;
    #   extraPkgs = pkgs: [ bumblebee glxinfo ];
    #}).run
    #(steam.override { withJava = true; })
  ];
}

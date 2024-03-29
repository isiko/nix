{ pkgs, ... }:

let 
  #unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # Wacom Tablet
  hardware.opentabletdriver.enable = true;
  #services.xserver.wacom.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # Packages
  # Search like this: nix search <PackageName>
  environment.systemPackages = with pkgs; [
    exfat
    home-manager

    # Compilers and Programming stuff
    #rustup
    # cargo
    # rustc
    jdk21

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
    dig 
    pferd
    mtr
    file
    tmux
    iftop
    mpd

    # Some more cool stuff :D
    cmatrix
    asciiquarium
    cowsay
    nms       # Text-Apearing Effect
    neofetch
    figlet
    timer
    sl
    cava      # Audio Visualizer
    cavalier  # Audio Visualizer
    asciiquarium

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
    tor-browser
    webcord
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
    fractal
    spotify
    keepassxc
    firefox
    chromium
    signal-desktop
    obsidian
    gnome.nautilus
    gnome.sushi # Some stuff for nautilus
    rnote
    #discord-canary # The normal discord package didn't work for me, it would always log me out. I'll maby switch back in the future
    google-chrome
    libreoffice

    # Games
    mindustry-wayland
    minecraft
    prismlauncher

    # Terminals
    kitty

    # Some Background tools
    wl-clipboard
    libnotify
    pciutils
    xdg-utils
    iio-sensor-proxy
    upower
    playerctl # Needed for Waybar Spotify Integration

    # Keyring
    gcr
    gnupg # Mostly for ssh
  ];

}

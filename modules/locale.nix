{
  time.timeZone = "Europe/Berlin";      # Timezone
  console.keyMap = "de";                # Console Keymap 
  i18n.defaultLocale = "de_DE.UTF-8";   # Select internationalisation properties.
  i18n.extraLocaleSettings = {          # More Location Stuff
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Environment Variables
  environment.variables = {
    SUDO_EDITOR = "/bin/hx";

    GRIM_DEFAULT_DIR="/tmp/";

    # Don't know if I *have* to set these, but I'm doing it anyway
    ##GTK_THEME= "Nord";
    #GDK_BACKEND="wayland,x11";
    #SDL_VIDEODRIVER="wayland";
    ##XDG_CURRENT_DElKTOP="Hyprland";
    ##XDG_SESSION_DESKTOP="Hyprland";
    ##XDG_CURRENT_DESKTOP="sway";
    ##XDG_SESSION_DESKTOP="sway";
    #XDG_SESSION_TYPE="wayland";
    #QT_AUTO_SCREEN_SCALE_FACTOR="1";
    #QT_QPA_PLATFORM="wayland;xcb";
    #QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
    #QT_QPA_PLATFORMTHEME="qt5ct";
  };
}

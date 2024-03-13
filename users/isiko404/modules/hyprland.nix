{config, pkgs, ...}:

let 
  vars = import ../vars.nix;
  
  workspace_binds = key: workspace: [
      "$mainMod, ${toString key}, workspace, ${toString workspace}"
      "$mainMod ALT, ${toString key}, moveworkspacetomonitor, ${toString workspace} current"
      "$mainMod ALT, ${toString key}, workspace, ${toString workspace}"
      "$mainMod SHIFT, ${toString key}, movetoworkspace, ${toString workspace}"
  ];
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
        "$mainMod" = "SUPER";
        animations = {
            enabled = true;
            bezier = [
                "overshoot,0.34,1.56,0.64,1"
                "smoothInOut,0.83,0,0.17,1"
                "smoothInOutSine,0.37, 0, 0.63, 1"
                "smoothOut,0.22,1,0.36,1"
                "smoothIn,0.64,0,0.78,0"
                "linear,0,0,1,1"
            ];

            animation = [
                "windowsIn,   1, 3, smoothOut,        slide"
                "windowsOut,  1, 3, smoothIn,         slide"
                "windowsMove, 1, 3, smoothOut,        slide"
                "workspaces,  1, 3, smoothInOutSine,  slide"
                "fadeIn,      1, 3, smoothOut"
                "fadeOut,     1, 3, smoothIn"
                "border,      0"

            ];
        };
        bind = [
            #"$mainMod, Space, exec, kitty"
            "$mainMod, Space, exec, ${pkgs.alacritty}/bin/alacritty"
            "$mainMod, B, exec, firefox"
            "$mainMod, N, exec, obsidian"
            "$mainMod, D, exec, ${pkgs.discord}/bin/discord"
            "$mainMod, E, exec, thunderbird"
            "$mainMod, S, exec, nautilus"
            "$mainMod, P, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | wl-copy"
            "$mainMod ALT, P, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"

            "$mainMod, C, killactive,"
            "$mainMod, M, exit,"
            "$mainMod, V, togglefloating,"
            "$mainMod, X, exec, killall wofi || ${pkgs.wofi}/bin/wofi -S drun -M contains -IimbG"
            #"$mainMod, X, exec, killall rofi || rofi -show drun -show-icons -theme nord" #~/.config/rofi/global/rofi.rasi
            "$mainMod, Y, exec, ${pkgs.hyprlock}/bin/hyprlock" # -i /home/isiko404/Pictures/wallpaper/unifest.png

            "$mainMod CONTROL, L, workspace, +1"
            "$mainMod CONTROL, H, workspace, -1"
            "$mainMod CONTROL ALT, H, movetoworkspace, -1"
            "$mainMod CONTROL ALT, L, movetoworkspace, +1" 

            "$mainMod, L, movefocus, r"
            "$mainMod, H, movefocus, l"
            "$mainMod, K, movefocus, u"
            "$mainMod, J, movefocus, d"

            "$mainMod, right, movefocus, r"
            "$mainMod, left, movefocus, l"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            "$mainMod ALT, right, movewindow, r"
            "$mainMod ALT, left, movewindow, l"
            "$mainMod ALT, up, movewindow, u"
            "$mainMod ALT, down, movewindow, d"

            "$mainMod ALT, L, movewindow, r"
            "$mainMod ALT, H, movewindow, l"
            "$mainMod ALT, K, movewindow, u"
            "$mainMod ALT, J, movewindow, d"

            "$mainMod, F, fullscreen, 0"
            "$mainMod ALT, F, fullscreen, 1"
            "$mainMod SHIFT, F, fakefullscreen"
            "$mainMod CONTROL, F, fullscreen, 1"
            "$mainMod CONTROL, F, fakefullscreen"

            "$mainMod, G, pseudo," # switch to dwindle
            "$mainMod, O, togglesplit,"
            #"$mainMod, TAB, layoutmsg, cyclenext"
            #"$mainMod SHIFT, TAB, layoutmsg, cycleprev"
            #"$mainMod, A, layoutmsg, swapwithmaster"

            "$mainMod, O, layoutmsg, orientationnext"
            "$mainMod, TAB, layoutmsg, cyclenext"
            "$mainMod SHIFT, TAB, layoutmsg, cycleprev"
            "$mainMod, A, layoutmsg, swapwithmaster"

            ",XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
            ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
            ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ]
        ++ workspace_binds 1 1
        ++ workspace_binds 2 2
        ++ workspace_binds 3 3
        ++ workspace_binds 4 4
        ++ workspace_binds 5 5
        ++ workspace_binds 6 6
        ++ workspace_binds 7 7
        ++ workspace_binds 8 8
        ++ workspace_binds 9 9
        ++ workspace_binds 0 10;
        bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];
        exec = [
            "${pkgs.waybar}/bin/waybar"
            #"swaync --config ~/.config/swaync/config.json"
            "${pkgs.element-desktop}/bin/element-desktop --hidden --profile Privat"
            "${pkgs.element-desktop}/bin/element-desktop --hidden --profile KIT"
            "${pkgs.element-desktop}/bin/element-desktop --hidden --profile FSMI"
            "/usr/lib/polkit-kde-authentication-agent-1"
            "wl-clipboard-history -t"
            "${pkgs.swaybg}/bin/swaybg -m fill -i ${vars.wallpaperPath}"
            "${pkgs.discord}/bin/discord"
            "blueman-applet"
            "${pkgs.networkmanagerapplet}/bin/nm-applet"
            #"flameshot"
            #"qpwgraph -m"
            #''tmux new-session -d "btop" \; split-window -v "gping -n 2 -b 600 s1.isiko404.dev s2.isiko404.dev s3.isiko404.dev 1.1.1.1" \; split-window -h "sudo iftop" \; rename-session "Startup" \; rename-window "Stats" \; resize-pane -D 10 \; select-pane -t :+.top \; set status off''
            # "alacritty -e cmatrix"
            # "jetbrains-toolbox"
        ];
        input = {
            kb_layout = "de";
            # kb_variant =
            # kb_model =
            # kb_options =
            # kb_rules =

            follow_mouse = 1;

            touchpad = {
                natural_scroll = true;
            };

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };
        general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 2;
            "col.active_border" = "rgba(de4040ff)";
            #"col.inactive_border" = "rgba(2d42ffff)";
            layout = "dwindle";
        };
        gestures = {
            workspace_swipe = true;
        };
        master = {
            new_is_master = true;
        };
        dwindle = {
            pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = false; # you probably want this
            smart_split = true; # you probably want this
            #no_gaps_when_only = -1;
        };
        misc = {
            disable_hyprland_logo = true;
            #enable_swallow = true;
        };
        decoration = {
            rounding = 0;
            blur = {
              enabled = true;
            };
            #blur = true;
            #blur_size = 30;
            #blur_passes = 4;
            #blur_new_optimizations = true;

            drop_shadow = true;
            shadow_range = 4;
            shadow_render_power = 3;
            "col.shadow" = "rgba(1a1a1aee)";
        };
        #env = "XCURSOR_SIZE,24";
    };
    extraConfig = ''
        # ## Fachschaft
        # monitor=eDP-1,1920x1080@60,960x1200,1
        # monitor=desc:LG Electronics 24EB23 609NTFAF4483,1920x1200@60,0x0,1
        # monitor=desc:LG Electronics 24EB23 305NDGL87831,1920x1200@60,1920x0,1
        # 
        # ## Home (Vertical)
        # monitor=DP-3,1920x1080@60, 760x0, 1
        # monitor=DP-4,3440x1440@60, 0x1080, 1
        # #monitor=desc:'GIGA-BYTE TECHNOLOGY CO., LTD. G34WQC A',3440x1440@60, 0x1080, 1
        # monitor=eDP-1,1920x1080@60,760x2520,1

        # #monitor=HDMI-A-1,3440x1440@60, 0x1080, 1
        # #monitor=eDP-1,1920x1080@60,760x2520,1
        # 
        # ## Home (Horizontal)
        # #monitor=eDP-1,1920x1080@60,0x720,1
        # #monitor=HDMI-A-1,3440x1440@60, 1920x0, 1

        # ## Standard (Expand)
        # #monitor=DP-1,1920x1080@60,0x0,1
        # #monitor=,preferred,auto,1
    '';
  };
}

# Old "Move to current Monitor" Code, left here for hacky ness :D
# bind = $mainMod, 1, exec, workspaceID=1  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 2, exec, workspaceID=2  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 3, exec, workspaceID=3  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 4, exec, workspaceID=4  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 5, exec, workspaceID=5  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 6, exec, workspaceID=6  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 2 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 7, exec, workspaceID=7  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 8, exec, workspaceID=8  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 9, exec, workspaceID=9  && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID
# bind = $mainMod, 0, exec, workspaceID=10 && hyprctl dispatch moveworkspacetomonitor $workspaceID $(kitty  -T TEMP --detach -- sleep 1 && sleep 0.2 && hyprctl activewindow | sed -n 's/.*monitor: \([[:digit:]]\+\).*/\1/p') && hyprctl dispatch workspace $workspaceID

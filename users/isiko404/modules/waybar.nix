{ pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      mainBar = {
        id = "waybar";
        height = 30;
        margin = "0px 0px 0p 0px";
        name = "top";
        layer = "top";
        position = "top";
        modules-left = ["clock" "hyprland/workspaces" "hyprland/window"];
        modules-center = [  ];
        modules-right = [ "mpris" "hyprland/submap" "tray" "disk" "memory" "cpu" "network" "wireplumber" "backlight" "battery"];
        "hyprland/workspaces"= {
          active-only = false;
          all-outputs = true;
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "hyprland/window" = {
          "format" = "{}";
          "separate-outputs" = true;
        };
        "clock" = {
          "format" = "{:%T | %a %d. %B %Y}";
          "tooltip" = true;
          "on-click" = "swaync-client -t -sw";
          "interval" = 1;
        };
        "clock#utc" = {
          "format" = "{:%H:%M UTC}";
          "timezone" = "Etc/UTC";
          "on-click" = "swaync-client -t -sw";
        };
        "battery" = {
          "format" = "{capacity}% {icon}";
          "tooltip-format" = "{time}";
          "format-alt-click" = "click-right";
          "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          "format-charging" = "{capacity}%  ";
          "format-plugged" = "{capacity}%  ";
          "interval" = 10;
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
          };
        };
        "network" = {
          "format" = "{essid} {icon}";
          "format-icons" = {
            "wifi" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤥" "󰤨"];
            "ethernet" = [""];
            "disconnected" = ["󰤭"];
          };   
          "format-disconnected" = "{icon}";
          "format-alt-click" = "click-right";
          "tooltip-format" = "{ifname} via {gwaddr}";
          "tooltip-format-wifi" = "{ipaddr}/{cidr}\n{signalStrength}%: ({bandwidthUpBits} | {bandwidthDownBits})";
          "tooltip-format-ethernet" = "{ipaddr}/{cidr}\n{signalStrength}%: ({bandwidthUpBits} | {bandwidthDownBits})\n{ifname}";
          "tooltip-format-disconnected" = "";
          "on-click" = "alacritty --command nmtui";
          "tooltip" = true;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon}";
          "tooltip-format" = "{percent}%";
          "format-icons" = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
          "on-scroll-up" = ''${pkgs.brightnessctl}/bin/brightnessctl set 5%-'';
          "on-scroll-down" = ''${pkgs.brightnessctl}/bin/brightnessctl set 5%+'';
          "states" = {
            "low" = 0;
            "mid" = 50;
            "high" = 75;
          };
          "smooth-scrolling-threshold" = 1.0;
        };
        "wireplumber" = {
          "format" = "{icon}";
          "format-alt-click" = "click-right";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "tooltip-format" = "{volume}%";
          "on-click" = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "on-scroll-up" = "${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+";
          "on-scroll-down" = "${pkgs.wireplumber}/bin/wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-";
        };
        "cpu" = {
          "interval" = 1;
          "format" = "{icon0} {icon1} {icon2} {icon3} {icon4} {icon5}";
          "tooltip" = "Total:  {iconN}";
          "format-alt-click" = "click-right";
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          "states" = {
            "low" = 0;
            "mid" = 25;
            "high" = 50;
          };
        };
        "memory" = {
          "interval" = 30;
          "format" = "{percentage}% ";
          "tooltip-format" = "{used:0.1f}G used\n{avail:0.1f}G available\n{total:0.1f}G total";
          "format-alt-click" = "click-right";
          "on-click" = "~/.config/waybar/custom/stats.sh memory";
          "states" = {
            "low" = 0;
            "mid" = 50;
            "high" = 75;
          };
        };
        "disk" = {
          "interval" = 30;
          "format" = "{percentage_used}% ";
          "format-alt-click" = "click-right";
          "tooltip-format" = "{used} used\n{free} free\n{total} total";
          "path" ="/home/";
        };
# "custom/containers" = {
#     "format" = "";
#     "interval" = 10;
#     "return-type" = "json";
#     "exec" = "~/.config/waybar/custom/containers-monitor.sh";
# };
        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon} {}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span> ";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span> ";
            "dnd-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "sleep 0.1; swaync-client -t -sw";
          "on-click-right" = "swaync-client --close-all";
          "escape" = true;
        };
        "tray" = {
          "icon-size" = 12;
          "spacing" = 10; 
        };
# "custom/spotify-metadata" = {
#     "format" = "{}  ";
#     "max-length" = 60;
#     "interval" = 30;
#     "return-type" = "json";
#     "exec" = "~/.config/waybar/custom/spotify/metadata.sh";
#     "on-click" = "~/.config/waybar/custom/spotify/controls.sh";
#     "on-scroll-up" = "~/.config/waybar/custom/spotify/controls.sh next";
#     "on-scroll-down" = "~/.config/waybar/custom/spotify/controls.sh previous";
#     "signal" = 5;
#     "smooth-scrolling-threshold" = 1.0;
# };
        "wlr/taskbar" = {
          "format" = "{icon}";
          "sort-by-app-id" = true;
          "icon-size" = 13;
          "icon-theme" = "Numix-Circle";
          "tooltip-format" = "{title}";
          "on-click" = "activate";
          "on-click-right" = "close";
          "markup" = true;
          "ignore-list" = [
            "alacritty"
          ];
        };
        "mpd" = {
          "format" = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "interval" = 10;
          "consume-icons" = {
            "on" = " "; # Icon shows only when "consume" is on
          };
          "random-icons" = {
            "off" = "<span color=\"#f53c3c\"></span> "; # Icon grayed out when "random" is off
              "on" = " ";
          };
          "repeat-icons" = {
            "on" = " ";
          };
          "single-icons" = {
            "on" = "1 ";
          };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "mpris" = {
          "format-playing" = "{player_icon} {artist}: {title}";
          "format-paused" =  "{player_icon} <i>{artist}: {title}</i>";
          "format-stopped" = "{player_icon} Stopped";
          "tooltip-format" =         "{player_icon} {title} ({album}) by {artist}\n{status_icon} {position} / {length}";
          "tooltip-format-stopped" = "";
          "player-icons" = {
            "default" = "🎵";
            "spotify" = "";
            "vlc" = "󰕼";
            "firefox" = "";
            "chrome" = "";
            "chromium" = "";
          };
          "status-icons" = {
            "playing" = "";
            "paused" = "";
            "stopped" = "";
          };
          "interval" = 1;
        };
      };
    };
    #style = builtins.readFile ./waybar.styles/default.css;
    style = builtins.readFile ./waybar.styles/37C3.css;
};
}

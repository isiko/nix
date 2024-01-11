{config, pkgs, ...}:

let
  vars = import ../vars.nix;
  transparent = "00000000";
  black = "000000ff";
  white = "ffffffff";
  verylightgrey = "d9d9d9ff";
  lightgrey = "aaaaaaff";
  mediumgrey = "7a7a7aff";
  darkgray = "202020ff";
  red = "de4040ff";
  blue = "2d42ffff";
  green = "79ff5eff";
  darkred = "561010ff";
  darkblue = "0b1575ff";
  darkgreen = "2b8d18ff";
  cyan = "29ffffff";
  magenta = "de37ffff";
  yellow = "f6f675ff";
  darkcyan = "006b6bff";
  darkmagenta = "66007aff";
  darkyellow = "757501ff";
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      show-keyboard-layout = true;
      #indicator = true;
      indicator-caps-lock = true;
      image = vars.wallpaperPath;
      #screenshots = true;
      #effect-blur = "20x5";
      #effect-vignette = "05:05";

      separator-color = transparent;

      layout-text-color = white;

      inside-color = transparent;
      inside-clear-color = transparent;
      inside-caps-lock-color = yellow;
      inside-ver-color = blue;
      inside-wrong-color = red;

      key-hl-color = red;
      bs-hl-color = red;

      ring-color = darkgreen;
      ring-caps-lock-color = darkyellow;

      ring-clear-color = yellow;
      ring-ver-color = blue;
      ring-wrong-color = red;

      text-color = white;
      text-clear-color = white;
      text-caps-lock-color = white;
      text-ver-color = white;
      text-wrong-color = white;
    };
  };
}

{config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      scrolling = {
        history = 5000;
      };
      bell = {
        animation = "Ease";
        duration = 100;
        color = "0xffffff";
      };
      window = {
        dynamic_padding = false;
        opacity = 1;
        title = "Alacritty";
        class = {
          general = "Alacritty";
          instance = "Alacritty";
        };
        padding = {
          x = 0;
          y = 0;
        };
      };
      font = {
        size = 9;
        bold = {
          family = "Inconsolata Nerd Font";
          style = "Regular";
        };
        bold_italic = {
          family = "Inconsolata Nerd Font";
          style = "Bold Italic";
        };
        italic = {
          family = "Inconsolata Nerd Font";
          style = "Italic";
        };
        normal = {
          family = "Inconsolata Nerd Font";
          style = "Regular";
        };
        offset = {
          x = 0;
          y = 0;
        };
      };
      colors = {
        draw_bold_text_with_bright_colors = true;
        bright = {
          black = "#7a7a7a";
          white = "#ffffff";
          blue = "#2d42ff";
          cyan = "#29ffff";
          green = "#79ff5e";
          magenta = "#de37ff";
          red = "#de4040";
          yellow = "#f6f675";
        };
        cursor = {
          cursor = "#ffffff";
          text = "CellBackground";
        };
        normal = {
          #black = "#000000";
          #white = "#ffffff";
          #blue = "#2d42ff";
          #cyan = "#29ffff";
          #green = "#79ff5e";
          #magenta = "#de37ff";
          #red = "#de4040";
          #yellow = "#f6f675";

          black = "#202020";
          white = "#ffffff";
          blue = "#5151ef";
          cyan = "#70c0ba";
          green = "#98be65";
          magenta = "#c678dd";
          red = "#ff6c6b";
          yellow = "#da8548";
        };
        primary = {
          background = "#202020";
          foreground = "#d9d9d9";
        };
        selection = {
          background = "#d9d9d9";
          text = "#202020";
        };
      };
      #schemes = {
      #  "37C3" = {
      #    bright = {
      #      black = "#000000";
      #      blue = "#2d42ff";
      #      cyan = "#29ffff";
      #      green = "#79ff5e";
      #      magenta = "#de37ff";
      #      red = "#de4040";
      #      white = "#ffffff";
      #      yellow = "#f6f675";
      #    };
      #    cursor = {
      #      cursor = "#ffffff";
      #      text = "CellBackground";
      #    };
      #    normal = {
      #      black = "#000000";
      #      blue = "#51afef";
      #      cyan = "#5699af";
      #      green = "#98be65";
      #      magenta = "#c678dd";
      #      red = "#ff6c6b";
      #      white = "#abb2bf";
      #      yellow = "#da8548";
      #    };
      #    primary = {
      #      background = "#000000";
      #      foreground = "#ffffff";
      #    };
      #    selection = {
      #      background = "#ffffff";
      #      text = "CellForeground";
      #    };
      #  };
      #  Dracula = {
      #    bright = {
      #      black = "#4d4d4d";
      #      blue = "#caa9fa";
      #      cyan = "#9aedfe";
      #      green = "#5af78e";
      #      magenta = "#ff92d0";
      #      red = "#ff6e67";
      #      white = "#e6e6e6";
      #      yellow = "#f4f99d";
      #    };
      #    cursor = {
      #      cursor = "CellForeground";
      #      text = "CellBackground";
      #    };
      #    dim = {
      #      black = "#14151b";
      #      blue = "#4d5b86";
      #      cyan = "#59dffc";
      #      green = "#1ef956";
      #      magenta = "#ff46b0";
      #      red = "#ff2222";
      #      white = "#e6e6d1";
      #      yellow = "#ebf85b";
      #    };
      #    line_indicator = {
      #      background = "None";
      #      foreground = "None";
      #    };
      #    normal = {
      #      black = "#000000";
      #      blue = "#bd93f9";
      #      cyan = "#8be9fd";
      #      green = "#50fa7b";
      #      magenta = "#ff79c6";
      #      red = "#ff5555";
      #      white = "#bfbfbf";
      #      yellow = "#f1fa8c";
      #    };
      #    primary = {
      #      background = "#282a36";
      #      foreground = "#f8f8f2";
      #    };
      #    search = {
      #      focused_match = {
      #        background = "#ffb86c";
      #        foreground = "#44475a";
      #      };
      #      matches = {
      #        background = "#50fa7b";
      #        foreground = "#44475a";
      #      };
      #    };
      #    selection = {
      #      background = "#44475a";
      #      text = "CellForeground";
      #    };
      #    vi_mode_cursor = {
      #      cursor = "CellForeground";
      #      text = "CellBackground";
      #    };
      #  };
      #};
    };
  };
}

##colors:
##  draw_bold_text_with_bright_colors: true
##  bright:
##    black: '#666666'
##    blue: '#81a2be'
##    cyan: '#54ced6'
##    green: '#9ec400'
##    magenta: '#b77ee0'
##    red: '#ff3334'
##    white: '#ffffff'
##    yellow: '#f0c674'
##  cursor:
##    cursor: '#ffffff'
##    text: '#1d1f21'
##  normal:
##    black: '#1d1f21'
##    blue: '#81a2be'
##    cyan: '#70c0ba'
##    green: '#b5bd68'
##    magenta: '#b294bb'
##    red: '#cc6666'
##    white: '#ffffff'
##    yellow: '#e6c547'
##  primary:
##    background: '#1d1f21'
##    foreground: '#c5c8c6'
#colors:
#  draw_bold_text_with_bright_colors: true
#  bright:
#    black: '#7a7a7a'
#    white: '#ffffff'
#    blue: '#2d42ff'
#    cyan: '#29ffff'
#    green: '#79ff5e'
#    magenta: '#de37ff'
#    red: '#de4040'
#    yellow: '#f6f675'
#  cursor:
#    cursor: '#ffffff'
#    text: CellBackground
#  normal:
#    #black: '#000000'
#    #white: '#ffffff'
#    #blue: '#2d42ff'
#    #cyan: '#29ffff'
#    #green: '#79ff5e'
#    #magenta: '#de37ff'
#    #red: '#de4040'
#    #yellow: '#f6f675'
#    
#    black: '#202020'
#    white: '#ffffff'
#    blue: '#5151ef'
#    cyan: '#70c0ba'
#    green: '#98be65'
#    magenta: '#c678dd'
#    red: '#ff6c6b'
#    yellow: '#da8548'
#  primary:
#    background: '#202020'
#    foreground: '#d9d9d9'
#  selection:
#    background: '#d9d9d9'
#    text: '#202020'
#env:
#  TERM: xterm-256color
#font:
#  size: 10
#  bold:
#    family: Inconsolata Nerd Font
#    style: Bold
#  bold_italic:
#    family: Inconsolata Nerd Font
#    style: Bold Italic
#  italic:
#    family: Inconsolata Nerd Font
#    style: Italic
#  normal:
#    family: Inconsolata Nerd Font
#    style: Regular
#  offset:
#    x: 0
#    'y': 0
#keyboard:
#  bindings:
#    - action: Paste
#      key: V
#      mods: Control|Shift
#    - action: Copy
#      key: C
#      mods: Control|Shift
#    - action: PasteSelection
#      key: Insert
#      mods: Shift
#    - action: ResetFontSize
#      key: Key0
#      mods: Control
#    - action: IncreaseFontSize
#      key: Equals
#      mods: Control
#    - action: IncreaseFontSize
#      key: Plus
#      mods: Control
#    - action: DecreaseFontSize
#      key: Minus
#      mods: Control
#    - action: ToggleFullscreen
#      key: F11
#      mods: None
#    - action: Paste
#      key: Paste
#      mods: None
#    - action: Copy
#      key: Copy
#      mods: None
#    - action: ClearLogNotice
#      key: L
#      mods: Control
#    - chars: "\f"
#      key: L
#      mods: Control
#    - action: ScrollPageUp
#      key: PageUp
#      mode: ~Alt
#      mods: None
#    - action: ScrollPageDown
#      key: PageDown
#      mode: ~Alt
#      mods: None
#    - action: ScrollToTop
#      key: Home
#      mode: ~Alt
#      mods: Shift
#    - action: ScrollToBottom
#      key: End
#      mode: ~Alt
#      mods: Shift
#schemes:
#  37C3:
#    bright:
#      black: '#000000'
#      blue: '#2d42ff'
#      cyan: '#29ffff'
#      green: '#79ff5e'
#      magenta: '#de37ff'
#      red: '#de4040'
#      white: '#ffffff'
#      yellow: '#f6f675'
#    cursor:
#      cursor: '#ffffff'
#      text: CellBackground
#    normal:
#      black: '#000000'
#      blue: '#51afef'
#      cyan: '#5699af'
#      green: '#98be65'
#      magenta: '#c678dd'
#      red: '#ff6c6b'
#      white: '#abb2bf'
#      yellow: '#da8548'
#    primary:
#      background: '#000000'
#      foreground: '#ffffff'
#    selection:
#      background: '#ffffff'
#      text: CellForeground
#  DoomOne:
#    bright:
#      black: '#5b6268'
#      blue: '#3071db'
#      cyan: '#46d9ff'
#      green: '#4db5bd'
#      magenta: '#a9a1e1'
#      red: '#da8548'
#      white: '#dfdfdf'
#      yellow: '#ecbe7b'
#    cursor:
#      cursor: '#528bff'
#      text: CellBackground
#    normal:
#      black: '#1c1f24'
#      blue: '#51afef'
#      cyan: '#5699af'
#      green: '#98be65'
#      magenta: '#c678dd'
#      red: '#ff6c6b'
#      white: '#abb2bf'
#      yellow: '#da8548'
#    primary:
#      background: '#282c34'
#      foreground: '#bbc2cf'
#    selection:
#      background: '#3e4451'
#      text: CellForeground
#  Dracula:
#    bright:
#      black: '#4d4d4d'
#      blue: '#caa9fa'
#      cyan: '#9aedfe'
#      green: '#5af78e'
#      magenta: '#ff92d0'
#      red: '#ff6e67'
#      white: '#e6e6e6'
#      yellow: '#f4f99d'
#    cursor:
#      cursor: CellForeground
#      text: CellBackground
#    dim:
#      black: '#14151b'
#      blue: '#4d5b86'
#      cyan: '#59dffc'
#      green: '#1ef956'
#      magenta: '#ff46b0'
#      red: '#ff2222'
#      white: '#e6e6d1'
#      yellow: '#ebf85b'
#    line_indicator:
#      background: None
#      foreground: None
#    normal:
#      black: '#000000'
#      blue: '#bd93f9'
#      cyan: '#8be9fd'
#      green: '#50fa7b'
#      magenta: '#ff79c6'
#      red: '#ff5555'
#      white: '#bfbfbf'
#      yellow: '#f1fa8c'
#    primary:
#      background: '#282a36'
#      foreground: '#f8f8f2'
#    search:
#      focused_match:
#        background: '#ffb86c'
#        foreground: '#44475a'
#      matches:
#        background: '#50fa7b'
#        foreground: '#44475a'
#    selection:
#      background: '#44475a'
#      text: CellForeground
#    vi_mode_cursor:
#      cursor: CellForeground
#      text: CellBackground
#  GruvboxDark:
#    bright:
#      black: '#928374'
#      blue: '#83a598'
#      cyan: '#8ec07c'
#      green: '#b8bb26'
#      magenta: '#d3869b'
#      red: '#fb4934'
#      white: '#ebdbb2'
#      yellow: '#fabd2f'
#    normal:
#      black: '#282828'
#      blue: '#458588'
#      cyan: '#689d6a'
#      green: '#98971a'
#      magenta: '#b16286'
#      red: '#cc241d'
#      white: '#a89984'
#      yellow: '#d79921'
#    primary:
#      background: '#282828'
#      foreground: '#ebdbb2'
#  MonokaiPro:
#    bright:
#      black: '#727072'
#      blue: '#FC9867'
#      cyan: '#78DCE8'
#      green: '#A9DC76'
#      magenta: '#AB9DF2'
#      red: '#FF6188'
#      white: '#FCFCFA'
#      yellow: '#FFD866'
#    normal:
#      black: '#403E41'
#      blue: '#FC9867'
#      cyan: '#78DCE8'
#      green: '#A9DC76'
#      magenta: '#AB9DF2'
#      red: '#FF6188'
#      white: '#FCFCFA'
#      yellow: '#FFD866'
#    primary:
#      background: '#2D2A2E'
#      foreground: '#FCFCFA'
#  Nord:
#    bright:
#      black: '#4C566A'
#      blue: '#81A1C1'
#      cyan: '#8FBCBB'
#      green: '#A3BE8C'
#      magenta: '#B48EAD'
#      red: '#BF616A'
#      white: '#ECEFF4'
#      yellow: '#EBCB8B'
#    normal:
#      black: '#3B4252'
#      blue: '#81A1C1'
#      cyan: '#88C0D0'
#      green: '#A3BE8C'
#      magenta: '#B48EAD'
#      red: '#BF616A'
#      white: '#E5E9F0'
#      yellow: '#EBCB8B'
#    primary:
#      background: '#2E3440'
#      foreground: '#D8DEE9'
#  OceanicNext:
#    bright:
#      black: '#343d46'
#      blue: '#6699cc'
#      cyan: '#5fb3b3'
#      green: '#99C794'
#      magenta: '#c594c5'
#      red: '#EC5f67'
#      white: '#d8dee9'
#      yellow: '#FAC863'
#    cursor:
#      cursor: '#ffffff'
#      text: '#1b2b34'
#    normal:
#      black: '#343d46'
#      blue: '#6699cc'
#      cyan: '#5fb3b3'
#      green: '#99C794'
#      magenta: '#c594c5'
#      red: '#EC5f67'
#      white: '#d8dee9'
#      yellow: '#FAC863'
#    primary:
#      background: '#1b2b34'
#      foreground: '#d8dee9'
#  Palenight:
#    bright:
#      black: '#434758'
#      blue: '#9cc4ff'
#      cyan: '#a3f7ff'
#      green: '#ddffa7'
#      magenta: '#e1acff'
#      red: '#ff8b92'
#      white: '#ffffff'
#      yellow: '#ffe585'
#    normal:
#      black: '#292d3e'
#      blue: '#82aaff'
#      cyan: '#89ddff'
#      green: '#c3e88d'
#      magenta: '#c792ea'
#      red: '#f07178'
#      white: '#d0d0d0'
#      yellow: '#ffcb6b'
#    primary:
#      background: '#292d3e'
#      foreground: '#d0d0d0'
#  SolarizedDark:
#    bright:
#      black: '#002b36'
#      blue: '#839496'
#      cyan: '#93a1a1'
#      green: '#586e75'
#      magenta: '#6c71c4'
#      red: '#cb4b16'
#      white: '#fdf6e3'
#      yellow: '#657b83'
#    cursor:
#      cursor: '#839496'
#      text: '#002b36'
#    normal:
#      black: '#073642'
#      blue: '#268bd2'
#      cyan: '#2aa198'
#      green: '#859900'
#      magenta: '#d33682'
#      red: '#dc322f'
#      white: '#eee8d5'
#      yellow: '#b58900'
#    primary:
#      background: '#002b36'
#      foreground: '#839496'
#  SolarizedLight:
#    bright:
#      black: '#002b36'
#      blue: '#839496'
#      cyan: '#93a1a1'
#      green: '#586e75'
#      magenta: '#6c71c4'
#      red: '#cb4b16'
#      white: '#fdf6e3'
#      yellow: '#657b83'
#    cursor:
#      cursor: '#657b83'
#      text: '#fdf6e3'
#    normal:
#      black: '#073642'
#      blue: '#268bd2'
#      cyan: '#2aa198'
#      green: '#859900'
#      magenta: '#d33682'
#      red: '#dc322f'
#      white: '#eee8d5'
#      yellow: '#b58900'
#    primary:
#      background: '#fdf6e3'
#      foreground: '#657b83'
#  TomorrowNight:
#    bright:
#      black: '#666666'
#      blue: '#81a2be'
#      cyan: '#54ced6'
#      green: '#9ec400'
#      magenta: '#b77ee0'
#      red: '#ff3334'
#      white: '#ffffff'
#      yellow: '#f0c674'
#    cursor:
#      cursor: '#ffffff'
#      text: '#1d1f21'
#    normal:
#      black: '#1d1f21'
#      blue: '#81a2be'
#      cyan: '#70c0ba'
#      green: '#b5bd68'
#      magenta: '#b294bb'
#      red: '#cc6666'
#      white: '#ffffff'
#      yellow: '#e6c547'
#    primary:
#      background: '#1d1f21'
#      foreground: '#c5c8c6'
#scrolling:
#  history: 5000
#window:
#  dynamic_padding: false
#  opacity: 1
#  title: Alacritty
#  class:
#    general: Alacritty
#    instance: Alacritty
#  padding:
#    x: 0
#    'y': 0
